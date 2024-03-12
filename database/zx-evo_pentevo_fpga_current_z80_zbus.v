`include "tune.v"

// PentEvo project (c) NedoPC 2008-2009
//
// manages ZX-bus IORQ-IORQGE stuff and free bus content
//

module zbus
(
  input  wire iorq,
  input  wire iorq_n,
  input  wire rd,

  output wire iorq1_n,
  output wire iorq2_n,

  input  wire iorqge1,
  input  wire iorqge2,

  input  wire porthit,

  output wire drive_ff
);

  assign iorq2_n = iorq1_n || iorqge1;

`ifdef FREE_IORQ
  assign iorq1_n = iorq_n;
  assign drive_ff = !iorq2_n && !iorqge2 && !porthit && rd;
`else
  assign iorq1_n = !iorq || porthit;              // iorq is masked my M1_n!
  assign drive_ff = !iorq2_n && !iorqge2 & rd;
`endif

endmodule
