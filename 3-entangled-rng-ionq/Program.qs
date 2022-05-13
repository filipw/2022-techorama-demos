namespace RNG {

    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Preparation;

    @EntryPoint()
    operation Main() : (Result[], Result[]) {
        mutable aliceResult = [];
        mutable bobResult = [];

        use alice = Qubit[4];
        use bob = Qubit[4];

        PrepareEntangledState(bob, alice);

        set aliceResult = MultiM(alice);
        set bobResult = MultiM(bob);
        return (aliceResult, bobResult);
    }
}