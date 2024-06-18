// This program was cloned from: https://github.com/adelfi172/Registers---Verilog
// License: GNU General Public License v3.0

/*
 * Testbench Name: registers_tb
 * Description: This testbench is designed to verify the functionality of the ShiftLeft and ShiftRight modules.
 *              It applies a series of test vectors to these modules to ensure that they correctly shift
 *              input data left and right, respectively. 
 *              This testbench checks for logical shift operations
 *              Appropriate for handling unsigned binary numbers.
 *
 * Author: Pereira, Rodrigo
 * Creation Date: 05/06/2024
 * Revision: Version 1.0
 */

`timescale 1ns / 1ps

module shift_registers_tb;

	localparam N = 8;

    // Inputs
    reg clk_tb;
    reg rst_tb;
    reg [N-1:0] data_i_tb;

    // Outputs
    wire [N-1:0] data_o_left;
    wire [N-1:0] data_o_right;

    // Instantiate the ShiftLeft module
    ShiftLeft u00_left (
        .clk_i (clk_tb),
        .rst_i (rst_tb),
        .data_i (data_i_tb),
        .data_o (data_o_left)
    );

    // Instantiate the ShiftRight module
    ShiftRight u01_right (
        .clk_i (clk_tb),
        .rst_i (rst_tb),
        .data_i (data_i_tb),
        .data_o (data_o_right)
    );

    // Clock generation
    always #10 clk_tb = ~clk_tb;

    // Initial block for test vectors
    initial begin
        // Initialize Inputs
        clk_tb = 0;
        rst_tb = 1;
        data_i_tb = 0;

        // Wait for global rst_tb
        #100;
        rst_tb = 0;

        // Apply test vectors
        #20 data_i_tb = 8'b10101010; // Arbitrary pattern
        #20 data_i_tb = 8'b01010101; // Inverse pattern

        // Additional shifts
        #20 data_i_tb = 8'b11110000;
        #20 data_i_tb = 8'b00001111;

        // Finalize test
        #20 $stop;
    end

    // Monitor changes ShiftRight and ShiftLeft module
    initial begin
		$display("*********************************************");
		$display("Monitor changes ShiftRight and ShiftLeft module");
        $monitor("Time=%t, Input = %b, ShiftLeft Output = %b, ShiftRight Output = %b",
			$time, data_i_tb, data_o_left, data_o_right);
		$display("*********************************************");
    end
	
	
	
	
	
endmodule
