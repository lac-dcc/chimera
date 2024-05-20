// This program was cloned from: https://github.com/PaolaUniSa/tt07-test0
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */
`default_nettype none

module tt_um_LeakyIntegrateFireNeuron (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire rst = ! rst_n;
 wire output_spikes;
LeakyIntegrateFireNeuron u_LeakyIntegrateFireNeuron(
    .clk(clk),                          // Clock signal
    .reset(rst),                        // Asynchronous reset, active high
    .enable(ena),                      // Enable input for updating the neuron
    .input_current(ui_in),          // Input current (I_ext)
    .threshold(uio_in),              // Firing threshold (V_thresh)
    .decay(uio_in),                 // Decay value adjusted based on membrane potential sign
    .refractory_period(uio_in),     // Refractory period in number of clock cycles, now 8 bits
    .spike_out(output_spikes)                // Output spike signal, renamed from 'fired'
);
    assign uo_out[0]=output_spikes;
    assign uo_out[7:1]=7'b0000000;
    assign uio_out=8'b00000000;
    
assign uio_oe = 8'b00000000; //used bidirectional pins as input

endmodule
