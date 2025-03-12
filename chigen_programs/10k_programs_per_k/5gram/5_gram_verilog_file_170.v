// Seed: 2846554441
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  assign module_1.id_1 = 0;
  inout wire id_1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_1 = 32'd25
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  output logic [7:0] id_3;
  inout logic [7:0] id_2;
  input wire _id_1;
  always_comb @(id_2[-1] or 1'b0) begin : LABEL_0
    id_3[id_1] = 1;
  end
  assign id_8 = id_1;
  parameter id_12 = 1 == -1 - 1;
  assign id_4 = (id_4);
  wire id_13;
  wire id_14;
  assign id_4[-1] = ~-1;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_8,
      id_5,
      id_13,
      id_14,
      id_7,
      id_14
  );
  logic [1 : 1  &  -1] id_15;
endmodule
