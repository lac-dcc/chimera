`include "versatile_mem_ctrl_defines.v"

module ddr_ff_in
  (
   input  C0,   // clock
   input  C1,   // clock
   input  D,    // data input
   input  CE,   // clock enable
   output Q0,   // data output
   output Q1,   // data output
   input  R,    // reset
   input  S     // set
   );

`ifdef XILINX
   IDDR2 #(
     .DDR_ALIGNMENT("NONE"),
     .INIT_Q0(1'b0),
     .INIT_Q1(1'b0), 
     .SRTYPE("SYNC"))
   IDDR2_inst (
     .Q0(Q0),
     .Q1(Q1),
     .C0(C0),
     .C1(C1),
     .CE(CE),
     .D(D),
     .R(R),
     .S(S)
   );
`endif   // XILINX

`ifdef ALTERA
   altddio_in #(
     .WIDTH(1),
     .POWER_UP_HIGH("OFF"),
     .INTENDED_DEVICE_FAMILY("Stratix III"))
   altddio_in_inst (
     .aset(),
     .datain(D),
     .inclocken(CE),
     .inclock(C0),
     .aclr(R),
     .dataout_h(Q0),
     .dataout_l(Q1)
   );
`endif   // ALTERA

`ifdef GENERIC_PRIMITIVES
   reg Q0_i, Q1_i;
   always @ (posedge R or posedge C0)
     if (R)
       Q0_i <= 1'b0;
     else
       Q0_i <= D;

   assign Q0 = Q0_i;

   always @ (posedge R or posedge C1)
     if (R)
       Q1_i <= 1'b0;
     else
       Q1_i <= D;

   assign Q1 = Q1_i;
`endif   // GENERIC_PRIMITIVES

endmodule   // ddr_ff_in


module ddr_ff_out
  (
   input  C0,   // clock
   input  C1,   // clock
   input  D0,   // data input
   input  D1,   // data input
   input  CE,   // clock enable
   output Q,    // data output
   input  R,    // reset
   input  S     // set
   );

`ifdef XILINX
   ODDR2 #(
     .DDR_ALIGNMENT("NONE"),
     .INIT(1'b0),
     .SRTYPE("SYNC"))
   ODDR2_inst (
     .Q(Q),
     .C0(C0),
     .C1(C1),
     .CE(CE),
     .D0(D0),
     .D1(D1),
     .R(R),
     .S(S)
   );
`endif   // XILINX

`ifdef ALTERA
   altddio_out #(
     .WIDTH(1),
     .POWER_UP_HIGH("OFF"),
     .INTENDED_DEVICE_FAMILY("Stratix III"),
     .OE_REG("UNUSED"))
   altddio_out_inst (
     .aset(),
     .datain_h(D0),
     .datain_l(D1),
     .outclocken(CE),
     .outclock(C0),
     .aclr(R),
     .dataout(Q)
   );
`endif   // ALTERA

`ifdef GENERIC_PRIMITIVES
   reg Q0, Q1;
   always @ (posedge R or posedge C0)
     if (R)
       Q0 <= 1'b0;
     else
       Q0 <= D0;

   always @ (posedge R or posedge C1)
     if (R)
       Q1 <= 1'b0;
     else
       Q1 <= D1;
 
   assign Q = C0 ? Q0 : Q1;
`endif   // GENERIC_PRIMITIVES

endmodule   // ddr_ff_out

