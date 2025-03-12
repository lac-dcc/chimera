// Seed: 925853386
module module_0;
  logic id_1;
  logic id_2;
  assign id_1 = id_1;
  always id_2 <= id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd68,
    parameter id_2 = 32'd16
) (
    input  wor  _id_0,
    output wire id_1,
    input  wor  _id_2
);
  parameter id_4 = 1;
  wire id_5;
  assign id_1 = id_2;
  struct packed {
    union packed {
      id_6 id_7;
      logic [id_2 : -1] id_8;
      logic id_9;
      logic [id_0 : -1 'b0] id_10;
      logic id_11;
      logic id_12;
    } id_13 = -1'd0;
    logic id_14;
  }
      id_15, id_16;
  always id_15.id_6 <= id_15.id_12;
  always_comb @(posedge 1 or -1)
    if (-1) begin : LABEL_0
      $signed(31);
      ;
    end else begin : LABEL_1
      if (~id_4) id_15.id_13 <= -1'b0;
    end
  always id_15[-1!=?-1] <= -1;
  wire id_17, id_18;
  wire id_19;
  parameter id_20 = id_4;
  wire id_21, id_22;
  module_0 modCall_1 ();
  logic id_23;
  ;
  logic id_24;
endmodule
