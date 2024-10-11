// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

// Define a simple adder module with parameters
module Adder #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] a, b,
    output [WIDTH-1:0] sum
);
    assign sum = a + b;
endmodule // Adder

// Define a multiplier module, also with parameters
module Multiplier #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] a, b,
    output [WIDTH-1:0] product
);
    assign product = a * b;
endmodule // Multiplier

// Top-level module that instantiates the Adder and Multiplier
module TopModule(
    input [7:0] x, y,
    output [7:0] sum, product
);
    // Parameters for instantiation
    parameter AdderWidth = 8, MultiplierWidth = 8;
    
    // Wire declarations
    wire [AdderWidth-1:0] adder_a, adder_b;
    wire [MultiplierWidth-1:0] multiplier_a, multiplier_b;

    // Redefinition of wire
    wire [7:0] sum;
    
    // Variable declarations
    reg a, b; // Example variables, not used in arithmetic here for simplicity
    
    // Instantiations with parameters
    Adder #(AdderWidth) adder_instance(adder_a, adder_b, sum), another_adder_instance(x, y, sum);
    Multiplier #(MultiplierWidth) multiplier_instance(multiplier_a, multiplier_b, product), another_multiplier_instance(x, y, product);
    
    // Initial block for simple variable assignments
    initial begin
        a = 0;
        b = 1;
    end
endmodule // TopModule
