// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/*
    Test Bench for 32-Bit Full Adder Module
    ---------------------------------------
    This test bench is designed to verify the functionality of the 32-bit Full Adder module.

    It instantiates the FullAdder_32bit module, provides inputs, and monitors the outputs.

    Inputs:
        - A, B: 32-bit input operands for the Full Adder.
        - Cin: 1-bit carry-in input.
    
    Outputs:
        - Sum: 32-bit output representing the sum of A, B, and Cin.
        - Cout: 1-bit carry-out output.

    Test Cases:
        - Case 1: A=50, B=10, Cin=1
        - Case 2: A=100, B=50, Cin=0 (complement of previous Cin)
*/

module TB_FullAdder_32bit ();

    integer i = 0;
    // Define the input and output wires
    reg [31:0] A, B, G_A, G_B, G_Sum;  
    reg Cin, G_Cin;         
    wire [31:0] Sum; 
    wire Cout;  
    reg Flag; // Flag to indicate if the results match

    // Instantiate the FullAdder_32bit module
    FullAdder_32bit FA_32(
        .A(A),          // Connect input port A of FullAdder_32bit module to signal A in test bench
        .B(B),          // Connect input port B of FullAdder_32bit module to signal B in test bench
        .Cin(Cin),      // Connect input port Cin of FullAdder_32bit module to signal Cin in test bench
        .Sum(Sum),      // Connect output port Sum of FullAdder_32bit module to signal Sum in test bench
        .Cout(Cout)     // Connect output port Cout of FullAdder_32bit module to signal Cout in test bench
    );

    // Define the golden model
    always @(*) begin
        G_Sum = G_A + G_B + G_Cin; 
    end
    
    // Initialize the inputs
    initial begin
        // Initialize inputs for the initial state
        A = 32'd0;   // Set A to 0   
        B = 32'd0;   // Set B to 0
        Cin = 1'b0;  // Set Cin to 0

        G_A = A;  // Set G_A to the initial value of A
        G_B = B;  // Set G_B to the initial value of B
        G_Cin = Cin;  // Update G_Cin with the current value of Cin

        // Initialize flag for the initial state
        Flag = 0;

        #5 // Delay for 5 units of time (5 ps)

        // Generate random values for A, B, and Cin in a loop
        for (i = 0; i < 10; i = i + 1) begin
            #5 // Delay for 5 units of time (5 ps)
            A = $random;    // Generate a random 32-bit value for A
            B = $random;    // Generate a random 32-bit value for B
            Cin = $random;  // Generate a random 1-bit value for Cin 
            
            G_A = A;  // Update G_A with the current value of A
            G_B = B;  // Update G_B with the current value of B
            G_Cin = Cin;  // Update G_Cin with the current value of Cin

            // Check if the results match
            Flag = (G_Sum ^ Sum);

            // Use $monitor to continuously display the results along with the flag
            $monitor("Test Case %0d: A=%d, B=%d, Cin=%b, Sum=%d, Cout=%b, Flag=%b", i, A, B, Cin, Sum, Cout, Flag);
        end

        // End simulation
        $finish;

    end


endmodule // TB_FullAdder_32bit
