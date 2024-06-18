// This program was cloned from: https://github.com/marqs85/snes_dejitter
// License: MIT License

// MIT License
// 
// Copyright (c) 2017-2018 Markus Hiienkari
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// 

`define EDGE_SENSITIVE_CLKEN

module snes_dejitter(
    input MCLK_XTAL_i, //NTSC master clock source: 21.477272MHz from oscillator circuit
    input MCLK_EXT_i,  //PAL master clock source: 21.28137MHz (3-CHIP) or 17.73MHz (1-CHIP) from external source
    input MCLK_SEL_i,  //Output clock/csync mode: De-jitter/NTSC (0), Bypass/PAL (1)
    input CSYNC_i,
    output MCLK_XTAL_o,
    output GCLK_o,
    output CSYNC_o,
    output reg SC_o
);

wire mclk_ntsc = MCLK_XTAL_i;
wire mclk_ntsc_dejitter = mclk_ntsc & gclk_en;
wire mclk_pal = MCLK_EXT_i;

assign GCLK_o = MCLK_SEL_i ? mclk_pal : mclk_ntsc_dejitter;
assign CSYNC_o = MCLK_SEL_i ? CSYNC_i : csync_dejitter;

assign MCLK_XTAL_o = ~MCLK_XTAL_i;

reg [10:0] h_cnt;
reg [2:0] g_cyc;
reg csync_prev;
reg csync_dejitter;
reg gclk_en;
reg [1:0] sc_ctr;


always @(posedge mclk_ntsc) begin
    if ((h_cnt >= 1024) && (csync_prev==1'b1) && (CSYNC_i==1'b0)) begin
        h_cnt <= 0;
        if (h_cnt == 340*4-1)
            g_cyc <= 4;
        else
            csync_dejitter <= CSYNC_i;
    end else begin
        h_cnt <= h_cnt + 1'b1;
        if (g_cyc > 0)
            g_cyc <= g_cyc - 1'b1;
        if (g_cyc <= 1)
            csync_dejitter <= CSYNC_i;
    end

    csync_prev <= CSYNC_i;
end

always @(posedge mclk_ntsc) begin
    if (sc_ctr == 2'h2) begin
        sc_ctr <= 2'h0;
        SC_o <= ~SC_o;
    end else begin
        sc_ctr <= sc_ctr + 2'h1;
    end
end

`ifdef EDGE_SENSITIVE_CLKEN
//Update clock gate enable signal on negative edge
always @(negedge mclk_ntsc) begin
    gclk_en <= (g_cyc == 0);
end
`else
//ATF1502AS macrocells support D latch mode,
//enabling level sensitive update of gclk_en during negative phase
always @(*) begin
    if (!mclk_ntsc)
        gclk_en <= (g_cyc == 0);
end
`endif

endmodule
