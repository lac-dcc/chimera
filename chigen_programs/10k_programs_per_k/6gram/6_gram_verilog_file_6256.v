// Seed: 3205567690
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_6 = 32'd91,
    parameter id_7 = 32'd80
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire _id_7;
  inout wire _id_6;
  output wire id_5;
  nand primCall (id_5, id_4, id_8, id_3, id_1, id_10, id_2, id_9);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5
  );
  inout wire id_1;
  wire id_11;
  logic [id_7 : id_6] id_12;
endmodule
