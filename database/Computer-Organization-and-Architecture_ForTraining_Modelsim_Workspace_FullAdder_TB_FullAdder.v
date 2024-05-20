// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/*
    Test Bench for 1-Bit Full Adder Module
    -------------------------------------
    This test bench is designed to verify the functionality of the 1-bit Full Adder module.

    It instantiates the FullAdder module, provides inputs, and monitors the outputs.

    Inputs:
        - A, B, Cin: Input bits to the Full Adder.
    
    Outputs:
        - Sum: The sum output of the Full Adder.
        - Cout: The carry-out output of the Full Adder.
*/

module TB_FullAdder ();

    integer i = 0;
    // Define the input and output wires
    reg A, B, Cin;
    wire Sum, Cout;

    // Instantiate the FullAdder module
    FullAdder FA1(
        .A(A),     // Connect A input
        .B(B),     // Connect B input
        .Cin(Cin), // Connect Cin input
        .Sum(Sum), // Connect Sum output
        .Cout(Cout)// Connect Cout output
    );

    // Define a clock signal for testing (if needed)
    reg clock;

    // Initialize the inputs
    initial begin
        // Provide initial values for inputs
        A = 1'b0;
        B = 1'b0;
        Cin = 1'b0;

        // Optionally, we can toggle inputs over time for dynamic testing
        // Example: Toggle A every 5 units of time
        for (i = 0; i < 10 ; i = i + 1) begin
            #5  A = ~A;
                B = ~B;
                Cin = ~Cin;
            #5  A = ~A;
                B = ~B;
                Cin = ~Cin;
            #5  A = ~A;
                B = ~B;
                Cin = ~Cin;
            #5  A = ~A;
                B = ~B;
                Cin = ~Cin;
        end
        
        // Monitor outputs
        $monitor("A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);

        // End simulation
        $finish;

    end

endmodule // TB_FullAdder
