namespace Demos {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;

    @EntryPoint()
    operation Start() : Unit {
        Message("Mach Zehnder interferometer");
        for i in 1..10 {
            MachZehnder();
        }
        
        Message("");
        Message("Mach Zehnder interferometer with QNDs");
        for i in 1..10 {
            MachZehnderWithQND();
        }
    }

    operation MachZehnder() : Unit {
        // allocate a new qubit in default state
        use photon = Qubit();

        // beam splitter
        H(photon);

        // second beam splitter
        H(photon);

        // result is a certain Zero == "detector2" due to interference
        let detectorResult = M(photon) == Zero ? "detector2" | "detector1";

        Message(detectorResult);
    }

    operation MachZehnderWithQND() : Unit {
        // allocate a new qubit in default state
        use photon = Qubit();

        // beam splitter
        H(photon);

        // observe using the QND - it is a random Zero or One
        let qndResult = M(photon) == Zero ? "qnd2" | "qnd1";

        // second beam splitter
        H(photon);

        // result is a random Zero or One - interference disappears
        let detectorResult = M(photon) == Zero ? "detector2" | "detector1";

        Message($"{qndResult} | {detectorResult}");
    }
}