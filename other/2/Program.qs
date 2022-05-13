namespace Demos {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;
    

    @EntryPoint()
    operation Start() : Unit {
        TestSet(PauliZ);
        Message("");
        TestSet(PauliX);
    }

    operation TestSet(basis : Pauli) : Unit {
        Message($"Measuring in {basis}");
        Message($"Prepared spin up");
        for i in 1..10 {
            SpinZ(basis, false); // up
        }
        Message("");
        Message($"Prepared spin down");
        for i in 1..10 {
            SpinZ(basis, true); // down
        }
        Message("");
        Message($"Prepared spin +");
        for i in 1..10 {
            SpinX(basis, false); // +
        }
        Message("");
        Message($"Prepared spin -");
        for i in 1..10 {
            SpinX(basis, true); // -
        }
    }

    operation SpinZ(basis : Pauli, flip : Bool) : Unit {
        use electron = Qubit();
        if (flip) { X(electron); }

        let result = Measure([basis], [electron]);

        Message(ResolveResult(result, basis));
        Reset(electron);
    }

    operation SpinX(basis : Pauli, flip : Bool) : Unit {
        use electron = Qubit();
        if (flip) { X(electron); }

        H(electron);
    
        let result = Measure([basis], [electron]);

        Message(ResolveResult(result, basis));
        Reset(electron);
    }

    function ResolveResult(result : Result, basis : Pauli) : String {
        return basis == PauliX ? 
            (result == Zero ? "+" | "-") | (result == Zero ? "up" | "down");
    }
}