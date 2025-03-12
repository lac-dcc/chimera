// Seed: 3237757903
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd21
) (
    id_1,
    id_2,
    _id_3,
    id_4[1 : id_3],
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input logic [7:0] id_4;
  module_0 modCall_1 (
      id_1,
      id_10
  );
  inout wire _id_3;
  output tri0 id_2;
  inout wire id_1;
  assign id_2 = id_3 ? 1 : id_5;
  logic id_11;
  wire  id_12;
  nor primCall (id_10, id_9, id_4, id_7, id_1, id_8, id_5);
  wire id_13;
endmodule
