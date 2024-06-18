// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          Debouncer RTL
// File:            debouncer.v
// Date created:    2021-05-31
// Author:          Aleksandar Lilic
// Description:     Simple debouncer module with 
//                  one wrapping counter total and 
//                  one saturating counter for each bit of the input
//
// Version history:
//      2021-05-31  AL  0.1.0 - Initial
//      2021-05-31  AL  1.0.0 - Release
//-----------------------------------------------------------------------------

module debouncer #(
    parameter WIDTH                     = 1,
    parameter SAMPLE_COUNT_MAX          = 25000,
    parameter PULSE_COUNT_MAX           = 150,
    parameter WRAPPING_COUNTER_WIDTH    = $clog2(SAMPLE_COUNT_MAX),
    parameter SATURATING_COUNTER_WIDTH  = $clog2(PULSE_COUNT_MAX)
)(
    input   wire             clk,
    input   wire             rst,
    input   wire [WIDTH-1:0] glitchy_signal,
    output  wire [WIDTH-1:0] debounced_signal
);

//-----------------------------------------------------------------------------
// Signals
// Wrapping counter
reg    [WRAPPING_COUNTER_WIDTH-1:0]    wrap_cnt;
wire   wrap_cnt_match;

// Saturating counter
genvar i;
reg    [SATURATING_COUNTER_WIDTH-1:0]  sat_cnt [WIDTH-1:0];
wire   [WIDTH-1:0] sat_cnt_en;
wire   [WIDTH-1:0] sat_cnt_match;

//-----------------------------------------------------------------------------
// Sample pulse generator
// Wrapping counter
always @(posedge clk) begin
    if (rst)
        wrap_cnt <= {WRAPPING_COUNTER_WIDTH{1'b0}};
    else if (wrap_cnt_match)
        wrap_cnt <= {WRAPPING_COUNTER_WIDTH{1'b0}};
    else
        wrap_cnt <= wrap_cnt + 1;
end

// Wrapping counter comparator
assign wrap_cnt_match = (SAMPLE_COUNT_MAX == wrap_cnt);

//-----------------------------------------------------------------------------
// Debouncer logic
generate
    // create 'WIDTH' number of Saturating counters: 1bit -> 1cnt
    for(i = 0; i < WIDTH; i = i + 1) begin
    
        // Enable
        assign sat_cnt_en[i] = wrap_cnt_match && glitchy_signal[i];
        
        // Saturating counter
        always @(posedge clk) begin
            if (rst || !glitchy_signal[i]) begin
                sat_cnt[i] <= {SATURATING_COUNTER_WIDTH{1'b0}};
            end 
            else if (sat_cnt_en[i]) begin
                if (!sat_cnt_match[i])  // increment only if not saturated
                    sat_cnt[i] <= sat_cnt[i] + 1;
            end
        end
        
        // Wrapping counter comparator
        assign sat_cnt_match[i]     = (PULSE_COUNT_MAX == sat_cnt[i]);
        assign debounced_signal[i]  = sat_cnt_match[i];
    end
endgenerate
endmodule
