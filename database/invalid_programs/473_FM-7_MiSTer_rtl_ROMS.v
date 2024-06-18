// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module ROMS (
  input [15:0] MADDRBUS,
  input RESETBn,
  input RFD0Fn,
  input WFD0Fn,
  input RDQEn,
  input CLKSYS,
  output FCXXn,
  output RAM1HB2n,
  output [7:0] ROMDATA,
  output BTRDYn,
  output BTROMn,
  output SUBSELn,
  output MIOSn,
  output RAM1HB1n,
  input [1:0] SW2
);

assign FCXXn = ~&MADDRBUS[15:10];

reg ff_q;

wire [3:0] m139_q;
wire [7:0] m151_q;
wire [7:0] m152_1_q;
wire [7:0] m152_2_q;

// &MADDRBUS[15:4] is a fix to force vectors from DOS ROM
wire [7:0] m152_q = SW2[0] || &MADDRBUS[15:4] ? m152_2_q : m152_1_q;

assign ROMDATA = m151_q | m152_q;

wire m107_q  = ~(MADDRBUS[15] & FCXXn & ff_q);
wire m120_q  = ~|SW2;

wire m131_q1 = ~MADDRBUS[9] | FCXXn;
wire m131_q2 = BTROMn | RDQEn;

wire m139_rdy_n;

assign SUBSELn  = FCXXn ? 1'b1 : m139_q[0];
assign MIOSn    = FCXXn ? 1'b1 : m139_q[1];
assign BTROMn   = FCXXn ? 1'b1 : m139_q[2];
assign RAM1HB1n = FCXXn ? 1'b1 : m139_q[3];
assign RAM1HB2n = m107_q;

wire pre = ~RFD0Fn;
wire clr = ~WFD0Fn;
wire ck  = ~RESETBn;
always @(posedge pre, posedge clr, posedge ck) begin
  if (pre) ff_q <= 1'b1;
  else if (clr) ff_q <= 1'b0;
  else ff_q <= m120_q;
end

m139 m139_u1(
  .clk   ( CLKSYS        ),
  .addr  ( MADDRBUS[9:1] ),
  .q     ( m139_q        ),
  .cs_n  ( FCXXn         ),
);

rom #("./roms/fbasic300.rom.mem", 15, 8) m151(
  .clk  ( CLKSYS         ),
  .addr ( MADDRBUS[14:0] ),
  .dout ( m151_q         ),
  .ce_n ( RDQEn | m107_q )
);

rom #("./roms/boot_bas.rom.mem", 9, 8) m152_1(
  .clk  ( CLKSYS            ),
  .addr ( MADDRBUS[8:0]     ),
  .dout ( m152_1_q          ),
  .ce_n ( m131_q1 | m131_q2 )
);

rom #("./roms/boot_dos_a.rom.mem", 9, 8) m152_2(
  .clk  ( CLKSYS            ),
  .addr ( MADDRBUS[8:0]     ),
  .dout ( m152_2_q          ),
  .ce_n ( m131_q1 | m131_q2 )
);

endmodule
