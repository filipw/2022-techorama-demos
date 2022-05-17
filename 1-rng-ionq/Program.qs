namespace RNG {

    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;

    @EntryPoint()
    operation Start() : Result[] {

        // allocate qubits
        use qubits = Qubit[4];

        // create superposition
        ApplyToEach(H, qubits);

        // measure qubits
        let results = MultiM(qubits);

        // return bits
        return results;
    }
}