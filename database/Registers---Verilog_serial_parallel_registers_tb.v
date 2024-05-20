// This program was cloned from: https://github.com/adelfi172/Registers---Verilog
// License: GNU General Public License v3.0

/*
 * Testbench Name: serial_parallel_registers_tb
 * Description: This testbench is designed to verify the functionality of the SISO, PIPO, SIPO, 
				and PISO modules.
 *              It reads input data from a text file and applies these vectors to each module to 
				ensure correct functionality.
 *              The testbench generates a waveform file for analysis and debugging.
 *
 * Author: Pereira, Rodrigo
 * Creation Date: 05/07/2024]
 * Revision: Version 1.0
 */

`timescale 1ns / 1ps

module serial_parallel_registers_tb;
  
    localparam N = 8;
    // Inputs
    reg          clk_tb;
    reg          rst_tb;
    reg          serial_i_tb;
    reg [N-1:0]  parallel_i_tb;
    reg          load_tb;

    // Outputs
    wire         serial_out_siso_tb;
    wire         serial_out_piso_tb;
    wire [N-1:0] parallel_out_sipo_tb;
    wire [N-1:0] parallel_out_pipo_tb;

    // Instantiate the SISO module
    SISO uut_siso (
        .clk_i       (clk_tb),
        .rst_i       (rst_tb),
        .serial_i    (serial_i_tb),
        .serial_o    (serial_out_siso_tb)
    );

    // Instantiate the PIPO module
    PIPO uut_pipo (
        .clk_i       (clk_tb),
        .rst_i       (rst_tb),
        .parallel_i  (parallel_i_tb),
        .parallel_o  (parallel_out_pipo_tb)
    );

    // Instantiate the SIPO module
    SIPO uut_sipo (
        .clk_i       (clk_tb),
        .rst_i	      (rst_tb),
        .serial_i    (serial_i_tb),
        .parallel_o  (parallel_out_sipo_tb)
    );

    // Instantiate the PISO module
    PISO uut_piso (
        .clk_i		     (clk_tb),
        .rst_i		     (rst_tb),
        .load_i		    (load_tb),
        .parallel_i  (parallel_i_tb),
        .serial_o    (serial_out_piso_tb)
    );

    // Clock generation
    always #10 clk_tb = ~clk_tb;

    // Load test data from file
    initial begin
        $readmemb("../src/data.txt", data_memory);
    end

    // Initial block for test vectors
    integer i;
    reg [7:0] data_memory [0:255]; // Adjust size as needed for test data

    initial begin
        // Initialize Inputs
        clk_tb 		     = 1'b0;
        rst_tb		      = 1'b1;
        serial_i_tb   = 1'b0;
        parallel_i_tb = 8'b0;
        load_tb 	     = 1'b0;

        // Wait for global reset
        #50;
        rst_tb		      = 1'b0;
        
        // Load data into registers and perform tests
        for (i = 0; i < 256; i = i + 1) begin
            #20; // Delay for visibility
            serial_i_tb   = data_memory[i][0]; // Least significant bit for serial inputs
            parallel_i_tb = data_memory[i]; // Full byte for parallel inputs
            load_tb = 1; // Pulse load for PISO
            #10;
            load_tb = 0;
        end

        // Finalize test
        #20 $stop;
    end

    // Dump waveforms
    initial begin
        $dumpfile("shift_registers.vcd");
        $dumpvars(0, serial_parallel_registers_tb);
    end

    // Monitor changes
    initial begin
      		$display("*********************************************");
  				$display("SISO - SIPO - PIPO - PISO");
        $monitor("Time = %t, Serial In = %b, SISO Out = %b, SIPO Out = %b, PISO Out = %b, PIPO Out = %b",
                 $time, serial_i_tb, serial_out_siso_tb, parallel_out_sipo_tb, 
				 serial_out_piso_tb, parallel_out_pipo_tb);
				$display("*********************************************");
    end
endmodule
