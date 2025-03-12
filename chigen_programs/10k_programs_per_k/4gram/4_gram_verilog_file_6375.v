// Seed: 3628315088
module module_0 (
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
    id_13
);
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_14 = 1'b0;
endmodule
module module_1 #(
    parameter id_1 = 32'd54
) (
    output tri1 id_0,
    input supply1 _id_1,
    output tri1 id_2,
    input uwire id_3,
    output wand id_4,
    input tri id_5,
    input supply0 id_6,
    output wand id_7,
    input supply0 id_8,
    input wand id_9,
    input supply0 id_10,
    output supply0 id_11,
    output uwire id_12,
    input tri id_13
);
  wire [id_1 : -1] id_15;
  nand primCall (id_4, id_9, id_15, id_10, id_3, id_5, id_6, id_13, id_8);
  module_0 modCall_1 (
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15,
      id_15
  );
endmodule
