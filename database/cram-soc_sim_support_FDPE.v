// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

module FDPE #(
  parameter [0:0] INIT = 1'b1,
  parameter [0:0] IS_C_INVERTED = 1'b0,
  parameter [0:0] IS_D_INVERTED = 1'b0,
  parameter [0:0] IS_PRE_INVERTED = 1'b0
)(
  output Q,

  input C,
  input CE,
  input D,
  input PRE
);

`ifdef FPGA_TARGET
    reg [0:0] IS_C_INVERTED_REG = IS_C_INVERTED;
    reg [0:0] IS_D_INVERTED_REG = IS_D_INVERTED;
    reg [0:0] IS_PRE_INVERTED_REG = IS_PRE_INVERTED;

    tri0 glblGSR = glbl.GSR;


    wire PRE_in;

    assign PRE_in = (PRE ^ IS_PRE_INVERTED_REG) && (PRE !== 1'bz);

// begin behavioral model

  reg Q_out;

  assign #100 Q = Q_out;

    always @(glblGSR or PRE_in)
      if (glblGSR) 
        assign Q_out = INIT;
      else if (PRE_in === 1'b1) 
        assign Q_out = 1'b1;
      else if (PRE_in === 1'bx) 
        assign Q_out = 1'bx;
      else
        deassign Q_out;

generate
if (IS_C_INVERTED == 1'b0) begin : generate_block1
  always @(posedge C or posedge PRE_in)
    if (PRE_in || (PRE === 1'bx && Q_out == 1'b1))
      Q_out <= 1'b1;
    else if (CE || (CE === 1'bz) || ((CE === 1'bx) && (Q_out == (D ^ IS_D_INVERTED_REG))))
      Q_out <= D ^ IS_D_INVERTED_REG;
end else begin : generate_block1
  always @(negedge C or posedge PRE_in)
    if (PRE_in || (PRE === 1'bx && Q_out == 1'b1))
      Q_out <= 1'b1;
    else if (CE || (CE === 1'bz) || ((CE === 1'bx) && (Q_out == (D ^ IS_D_INVERTED_REG))))
      Q_out <= D ^ IS_D_INVERTED_REG;
end
endgenerate

`else
    reg state;
initial begin
    state = INIT;
end

always @(posedge C or posedge PRE) begin
    if (PRE)
        state <= 1'b1;
    else if (CE)
        state <= D;
    else
        state <= state;
end

assign Q = state;

`endif

endmodule
