namespace RNG {

    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;

    @EntryPoint()
    operation Start() : Unit {

        // allocate qubits
        use qubits = Qubit[16];

        // create superposition
        ApplyToEach(H, qubits);

        // measure qubits
        let results = MultiM(qubits);

        // convert to integer
        let randomNumber = ResultArrayAsInt(results);
        Message($"Random uint16: {randomNumber}");
    }
}