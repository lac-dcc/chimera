// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

`timescale 1ns / 1ps

//------------------------------------------------------------------------------
// Module
//------------------------------------------------------------------------------

// this is a bit misnamed, it's not really a CDC. just a pulse extractor.
// turns out there isn't even enough time to do a CDC with the DMA engine's response
// latency to a request...
module cdc_pulse (
    input  wire          reset,
    input  wire          clk_a,
    input  wire          clk_b,
    input  wire          in_a,
    output wire          out_b
);

reg in_a_sync;

// this assumes that:
// 1. clk_a is less than or equal to clk_b
// 2. clk_a is mesochronous to clk_b, i.e., edges are always aligned, but the frequency may be different
//    So this works when the AHB bus clock is a power-of-2 factor of the PIO clock, and edge-aligned.
always @(posedge clk_b) begin
    if (reset) begin
        in_a_sync <= 0;
    end else begin
        in_a_sync <= in_a;
    end
end
// generates a single pulse in out_b domain
assign out_b = !in_a_sync & in_a;


//------------------------------------------------------------------------------
// Specialized Logic
//------------------------------------------------------------------------------

endmodule

