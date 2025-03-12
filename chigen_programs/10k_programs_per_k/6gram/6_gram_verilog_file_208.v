// Seed: 1059972076
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_13 = 32'd26,
    parameter id_2  = 32'd84,
    parameter id_6  = 32'd42
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15
);
  input wire id_15;
  output wire id_14;
  input wire _id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3
  );
  inout logic [7:0] id_8;
  input wire id_7;
  inout wire _id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire _id_2;
  output wire id_1;
  reg id_16 = -1 ? 1 : 'b0;
  assign id_2 = id_8;
  struct packed {
    logic [-1 : 1] id_17;
    logic [id_13 : id_2] id_18;
  } [1 : id_13] id_19;
  always @(id_15, -1) begin : LABEL_0
    id_16 = id_8[id_6] == id_16;
  end
endmodule
