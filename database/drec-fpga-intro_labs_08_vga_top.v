// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module top (
    input CLK,

    output H_SYNC, V_SYNC,
    output [4:0]V_R,
    output [5:0]V_G,
    output [4:0]V_B
);

reg [2:0]pix = 3'b111;

assign V_R = {5{pix[1]}};
assign V_G = {6{pix[2]}};
assign V_B = {5{pix[0]}};

wire vga_clk;

`ifdef __ICARUS__
assign vga_clk = CLK;
`else
pll pll_inst(
    .inclk0(CLK),
    .c0(vga_clk)
);
`endif

wire [9:0]x;
wire [9:0]y;

vga_sync vga_sync(vga_clk, H_SYNC, V_SYNC, x, y);

always @(posedge vga_clk) begin
    if ((x < 640) && (y < 480)) begin
        if (x % 80 == 0)
            pix <= pix - 3'b1;
    end
    else
        pix <= 0;
end

endmodule
