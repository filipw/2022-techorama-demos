namespace RNG {

    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;

    @EntryPoint()
    operation Main() : Unit {
        mutable agreedTotal = 0;
        for i in 1..100 {
            use alice = Qubit[8];
            use bob = Qubit[8];

            PrepareEntangledState(bob, alice);

            let resultAlice = ReadRandomNumber(alice);
            let resultBob = ReadRandomNumber(bob);

            Message($"Alice result: {resultAlice}, Bob result: {resultBob}");
            if (resultAlice == resultBob) {
                set agreedTotal += 1;
            }
        }

        Message($"Measurements agreed: {agreedTotal}");
    }

    operation ReadRandomNumber(qubits : Qubit[]) : Int {
        let results = MultiM(qubits);
        return ResultArrayAsInt(results);
    }
}