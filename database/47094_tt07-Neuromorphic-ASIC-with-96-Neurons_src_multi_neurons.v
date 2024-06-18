// This program was cloned from: https://github.com/BrosnanYuen/tt07-Neuromorphic-ASIC-with-96-Neurons
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_multi_neurons_brosnanyuen #(parameter NEURONS = 96, INPUTS=8, OUTPUTS=8, MEMORY=8) (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);



    genvar i;
    
    reg [NEURONS-1:0] RESET_VEC = 0;
    wire [NEURONS-1:0] NEURON_IN;
    wire [NEURONS-1:0] NEURON_OUT;

    // Generate for loop to instantiate N times
    generate
        for (i =0; i < NEURONS; i = i+ 1) begin
            single_neuron   #(.MEMORY(MEMORY) ) dut (
                .CLK (clk),
                .RST (RESET_VEC[i]),
                .CONTROL (ui_in[0]),
                .SEQ_IN (NEURON_IN[i]),
                .SEQ_OUT (NEURON_OUT[i])
            );
            if (i < INPUTS) begin
                assign NEURON_IN[i] = uio_in[i];
            end else begin
                if ((i% INPUTS) == 0) begin
                    assign NEURON_IN[i] = NEURON_OUT[ INPUTS*((i/INPUTS)-1)  + (i%INPUTS) ] || NEURON_OUT[ INPUTS*((i/INPUTS)-1)  + (i%INPUTS) + 1];
                end else if ((i% INPUTS) == (INPUTS-1)) begin
                    assign NEURON_IN[i] = NEURON_OUT[ INPUTS*((i/INPUTS)-1)  + (i%INPUTS) ] || NEURON_OUT[ INPUTS*((i/INPUTS)-1)  + (i%INPUTS) - 1];
                end else begin
                    assign NEURON_IN[i] = NEURON_OUT[ INPUTS*((i/INPUTS)-1)  + (i%INPUTS) ] || NEURON_OUT[ INPUTS*((i/INPUTS)-1)  + (i%INPUTS) -1 ] || NEURON_OUT[ INPUTS*((i/INPUTS)-1)  + (i%INPUTS) + 1] ;
                end
            end
            if (i >= (NEURONS-OUTPUTS)) begin
                assign uo_out[i%OUTPUTS] = NEURON_OUT[i];
            end
        end
    endgenerate

     always@(posedge clk) 
     begin
        RESET_VEC[ui_in[7:1]] <= rst_n;
     end
     
    

	assign uio_out = 0;
	assign uio_oe  = 0;

endmodule
