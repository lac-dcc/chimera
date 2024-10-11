// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

`timescale 1ns / 1ps

module select_encode_logic_tb;

    // Inputs
    reg [31:0] ir;
    reg gra, grb, grc, r_in, r_out, ba_out;

    // Outputs
    wire [15:0] r0_15in, r0_15out;
    wire [4:0] op_code;
    wire [31:0] c_sign_extended;

    // Instantiate the Unit Under Test (UUT)
    select_encode_logic uut (
        .ir(ir), 
        .gra(gra), 
        .grb(grb), 
        .grc(grc), 
        .r_in(r_in), 
        .r_out(r_out), 
        .ba_out(ba_out), 
        .r0_15in(r0_15in), 
        .r0_15out(r0_15out), 
        .op_code(op_code), 
        .c_sign_extended(c_sign_extended)
    );

    initial begin
        // Initialize Inputs
        ir = 0;
        gra = 0;
        grb = 0;
        grc = 0;
        r_in = 0;
        r_out = 0;
        ba_out = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        // Example instruction with opcode and registers set, adjust it to match your instruction set
        // Opcode: 5'b10010, Ra: 4'b0010, Rb: 4'b0101, Rc: 4'b1010, Constant C: 18'b000000000000001011
        ir = 32'b00001_0001_0010_1111111111110111011;
        gra = 1; grb = 0; grc = 0; r_in = 1; r_out = 0; ba_out = 0;
        #10; // Wait for 10 ns
        gra = 0; grb = 1; r_in = 0; r_out = 1;
        #10; // Wait for 10 ns
        grb = 0; grc = 1; r_out = 0; ba_out = 1;
        
        // Continue with other test vectors as needed...
        
        // Finish the simulation
        #100;
        $finish;
    end

    // Monitor changes and display them
    initial begin
        $monitor("At time %t, ir = %h (op_code = %b), A = %b, B = %b, C = %b, r0_15in = %b, r0_15out = %b, c_sign_extended = %h",
                 $time, ir, op_code, uut.A, uut.B, uut.C, r0_15in, r0_15out, c_sign_extended);
    end
    
endmodule