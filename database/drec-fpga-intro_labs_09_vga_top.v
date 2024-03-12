module top (
    input CLK,

    output H_SYNC, V_SYNC,
    output [4:0]V_R,
    output [5:0]V_G,
    output [4:0]V_B
);

reg [2:0]rgb;

assign V_R = {5{rgb[0]}};
assign V_G = {6{rgb[1]}};
assign V_B = {5{rgb[2]}};

wire vga_clk;
pll pll_inst(
    .inclk0(CLK),
    .c0(vga_clk)
);

wire [9:0]x;
wire [9:0]y;

reg [12:0]vrom_addr;
wire [2:0]vrom_q;

rom #(13, 3, "rom.txt") vrom(vrom_addr, vga_clk, vrom_q);

vga_sync vga_sync(vga_clk, H_SYNC, V_SYNC, x, y);

wire [9:0]x_fwd = x + 1;

always @(*) begin
    vrom_addr = x_fwd[9:3] + y[9:3] * 80;
    rgb = ((x < 640) && (y < 480)) ? vrom_q : 3'b0;
end

endmodule
