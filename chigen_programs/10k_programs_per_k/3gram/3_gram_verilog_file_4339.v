// Seed: 1210276280
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
macromodule module_1 #(
    parameter id_4 = 32'd89
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output uwire id_9;
  output wire id_8;
  output wire id_7;
  inout reg id_6;
  output wire id_5;
  input wire _id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  wire id_11;
  wire id_12;
  logic [1 : -1] id_13 = {1{id_11}};
  module_0 modCall_1 (
      id_11,
      id_11,
      id_13,
      id_10,
      id_10,
      id_12,
      id_5,
      id_13,
      id_12
  );
  assign id_2 = 1'd0 * id_9++;
  wire [-1 : id_4] id_14;
  always @(*) id_6 = id_14;
endmodule
