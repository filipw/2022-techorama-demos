namespace Demos {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;
    

    @EntryPoint()
    operation Start() : Result[] {
        mutable results = [];

        Message("Mach Zehnder interferometer");
        set results += [MachZehnder()];

        // Message("Mach Zehnder interferometer with QNDs");
        // set results += MachZehnderWithQND();

        return results;
    }

    operation MachZehnder() : Result {
        // allocate a new qubit in default state
        use photon = Qubit();

        // beam splitter
        H(photon);

        // second beam splitter
        H(photon);

        // result is a certain Zero == "detector2" due to interference
        // M(photon) == Zero ? "detector2" | "detector1";
        return M(photon);
    }

    operation MachZehnderWithQND() : Result[] {
        mutable results = [Zero, size = 2];

        // allocate a new qubit in default state
        use photon = Qubit();

        // beam splitter
        H(photon);

        // observe using the QND - it is a random Zero or One
        set results w/= 0 <- M(photon);

        // second beam splitter
        H(photon);

        // result is a random Zero or One - interference disappears
        set results w/= 1 <- M(photon);

        return results;
    }
}