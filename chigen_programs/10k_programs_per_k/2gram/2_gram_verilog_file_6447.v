// Seed: 3277619077
module module_0 #(
    parameter id_7 = 32'd20
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire _id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  assign module_1.id_11 = 0;
  inout wire id_2;
  inout uwire id_1;
  wire [-1  ^  ~  id_7 : 1 'b0] id_11;
  assign id_1 = 1;
  uwire id_12 = id_7 - id_1;
  wire [1 : 1] id_13;
endmodule
module module_1 #(
    parameter id_6 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire _id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always if (1) id_4[id_6] = -1;
  assign id_6 = id_1;
  logic id_11;
  assign id_11 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_2,
      id_9,
      id_10,
      id_6,
      id_8,
      id_3,
      id_11
  );
endmodule
