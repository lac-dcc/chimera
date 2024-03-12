module part7 (CLOCK_50, SW, KEY, LEDR, LEDG, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, SRAM_ADDR, SRAM_DQ, SRAM_CE_N, SRAM_OE_N, SRAM_WE_N, SRAM_UB_N, SRAM_LB_N);
  input CLOCK_50;
  input [17:0] SW;
  input [3:0] KEY;
  output [17:0] LEDR;
  output [8:0] LEDG;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  output [17:0] SRAM_ADDR;
  inout [15:0] SRAM_DQ;
  output SRAM_CE_N;
  output SRAM_OE_N;
  output SRAM_WE_N;
  output SRAM_UB_N;
  output SRAM_LB_N;
  
  assign SRAM_ADDR[17:5] = 13'b0000000000000;
  assign SRAM_DQ[15:8] = 8'b00000000;
  assign SRAM_CE_N = 0;
  assign SRAM_OE_N = 0;
  assign SRAM_UB_N = 0;
  assign SRAM_LB_N = 0;

  assign SRAM_WE_N = ~wren;
  assign SRAM_DQ[7:0] = wren ? din : 8'bZ ;
  assign dout = SRAM_DQ[7:0];
  assign SRAM_ADDR = muxaddr;

  wire [7:0] din;
  wire [7:0] dout;
  wire [4:0] addr;
  wire wren, clock;

  assign din = SW[7:0];
  assign wren = SW[17];
  assign clock = KEY[0];
  assign addr = SW[15:11];
  assign LEDR[7:0] = dout;
  assign LEDG[0] = wren;

  wire [4:0] raddr;
  wire [25:0] trigger;
  counter_modk C0 (CLOCK_50, clock, trigger);
  defparam C0.n = 26;
  defparam C0.k = 50000000;

  counter_modk C1 (trigger[25], clock, raddr);
  defparam C1.n = 5;
  defparam C1.k = 32;

  reg [4:0] muxaddr;
  always @(muxaddr, addr, raddr, wren) begin
    if (wren)
      muxaddr <= addr;
    else
      muxaddr <= raddr;
  end
  assign LEDR[17:13] = muxaddr;

  //ram1port R0 (muxaddr, CLOCK_50, din, wren, dout);

  hex_ssd H7 (addr[4], HEX7);
  hex_ssd H6 (addr[3:0], HEX6);
  hex_ssd H5 (din[7:4], HEX5);
  hex_ssd H4 (din[3:0], HEX4);
  hex_ssd H3 (raddr[4], HEX3);
  hex_ssd H2 (raddr[3:0], HEX2);
  hex_ssd H1 (dout[7:4], HEX1);
  hex_ssd H0 (dout[3:0], HEX0);
endmodule
