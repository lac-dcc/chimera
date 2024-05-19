// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns/1ps

// 96 MHz PLL
module jtframe_pll96(
    input        inclk0,
    output   reg c0,     // 96
    output   reg c1,     // 48
    output       c2,     // 96 (shifted by -2.5ns)
    output   reg c3,     // 24
    output   reg c4,     // 6
    output   reg locked
);

initial begin
    locked = 0;
    #30 locked = 1;
end

real base_clk = 10.417; //  96 MHz -> 10.417ns
reg  c3n;

initial begin
    c0  = 1'b0;
    c1  = 1'b0;
    c3n = 1'b0;
    forever c0 = #(base_clk/2.0) ~c0;
end

always @(posedge c0) begin
    { c3n, c1 } <= { c3n, c1 } + 2'd1; // 48 and 24
    c3 <= c3n;
end

integer cnt6;

initial begin
    cnt6=0;
    c4=0;
end

always @(posedge c0) begin
    cnt6 = cnt6==5 ? 0 : cnt6+1;
    if( cnt6==5 ) c4 <= ~c4;
end

/*
`ifdef SDRAM_DELAY
real sdram_delay = `SDRAM_DELAY;
initial $display("INFO: SDRAM_CLK delay set to %f ns",sdram_delay);
assign #sdram_delay c2 = c1;
`else
initial $display("INFO: SDRAM_CLK delay set to 1 ns");
assign #1 c2 = c1;
`endif
*/
assign c2=c0;

endmodule // jtgng_pll0

// 48 MHz PLL
module jtframe_pll0(
    input        inclk0,
    output   reg c0,     // 96
    output   reg c1,     // 48
    output       c2,     // 48 (shifted by -2.5ns)
    output   reg c3,     // 24
    output   reg c4,     // 6
    output   reg locked
);

initial begin
    locked = 0;
    #30 locked = 1;
end

reg nc;

`ifdef BASE_CLK
real base_clk = `BASE_CLK;
initial $display("INFO: base clock set to %f ns",base_clk);
`else
// 108 MHz -> 9.259ns
//  96 MHz -> 10.417ns
//  84 MHz -> 11.905ns
//  72 MHz -> 13.889ns X fails
//  48 MHz -> 20.833ns
real base_clk = 10.417;
`endif

initial begin
    c0 = 1'b0;
    c1 = 1'b0;
    c3 = 1'b0;
    c4 = 1'b0;
    nc = 1'b0;
    forever c0 = #(base_clk/2.0) ~c0;
end

always @(posedge c0) begin
    {c4,nc,c3,c1} <= {c4,nc,c3,c1} + 1'b1;
end

`ifdef SDRAM_DELAY
real sdram_delay = `SDRAM_DELAY;
initial $display("INFO: SDRAM_CLK delay set to %f ns",sdram_delay);
assign #sdram_delay c2 = c1;
`else
initial $display("INFO: SDRAM_CLK delay set to 1 ns");
assign #1 c2 = c1;
`endif

endmodule // jtgng_pll0


module jtframe_pll1 (
    input inclk0,
    output reg c0     // 25
);

initial begin
    c0 = 1'b0;
    forever c0 = #20 ~c0;
end

endmodule // jtgng_pll1


////////////////////////////////////////////////////
////////////////////////////////////////////////////
// 20 MHz PLL

module jtframe_pll20_fast(
    input        inclk0,
    output   reg c0,     // 20
    output   reg c1,     // 80
    output   reg c2,     // 80 (shifted by -2.5ns)
    output   reg locked
);

    initial begin
        locked = 0;
        #30 locked = 1;
    end

    `ifdef BASE_CLK
    real base_clk = `BASE_CLK;
    initial $display("INFO: base clock set to %f ns",base_clk);
    `else
    real base_clk = 12.5; // 80 MHz
    `endif

    initial begin
        c1 = 1'b0;
        forever c1 = #(base_clk/2.0) ~c1; // 80 MHz
    end

    reg [1:0] div=2'd0;

    assign c0 = div[1];

    always @(posedge c1) begin
        div <= div+'d1;
    end

    `ifdef SDRAM_DELAY
    real sdram_delay = `SDRAM_DELAY;
    initial $display("INFO pll20: SDRAM_CLK delay set to %f ns",sdram_delay);
    `else
    initial $display("INFO pll20: SDRAM_CLK delay set to 0 ns");
    real sdram_delay = 0;
    `endif

    initial begin
        c2 = 1'b0;
        #(sdram_delay);
        forever c2 = #(base_clk/2.0) ~c2; // 80 MHz
    end
endmodule

// 50.3496 MHz PLL
module plls16(
    input        inclk0,
    output   reg c0,     // 50.3
    output       c1,     // 50.3
    output       c2,     // 50.3 (shifted by -2.5ns)
    output   reg c3,     // 25.17
    output   reg c4,     // 6.29
    output   reg locked
);

initial begin
    locked = 0;
    #30 locked = 1;
end

assign c1=c0;

reg nc;

initial begin
    c0 = 1'b0;
    c3 = 1'b0;
    c4 = 1'b0;
    nc = 1'b0;
    forever c0 = #(19.861/2.0) ~c0;
end

always @(posedge c0) begin
    {c4,nc,c3} <= {c4,nc,c3} + 1'b1;
end

`ifdef SDRAM_DELAY
real sdram_delay = `SDRAM_DELAY;
initial $display("INFO: SDRAM_CLK delay set to %f ns",sdram_delay);
assign #sdram_delay c2 = c1;
`else
initial $display("INFO: SDRAM_CLK delay set to 1 ns");
assign #1 c2 = c1;
`endif

endmodule