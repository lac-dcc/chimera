// Seed: 472237528
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_4;
  wire id_5;
endmodule
module module_1 #(
    parameter id_13 = 32'd4
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14
);
  input wire id_14;
  output wire _id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  nor primCall (id_5, id_3, id_7, id_4, id_14, id_12, id_6, id_8, id_11, id_2, id_1, id_9);
  inout wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_5
  );
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic [id_13 : 1 'b0] id_15;
endmodule
