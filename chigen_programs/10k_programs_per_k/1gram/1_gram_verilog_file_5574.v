// Seed: 2897896279
module module_0 (
    input wand id_0,
    input wand id_1,
    output wire id_2,
    output wand id_3,
    input tri1 id_4,
    input tri1 id_5,
    output wor id_6,
    input supply0 id_7,
    output tri0 id_8,
    input wor id_9,
    output supply0 id_10,
    input wand id_11,
    input tri1 id_12,
    output wor id_13
);
endmodule
module module_1 #(
    parameter id_8 = 32'd20
) (
    output tri1 id_0,
    output tri id_1,
    output supply1 id_2,
    input wire id_3,
    output uwire id_4,
    output wire id_5,
    output tri0 id_6,
    input wire id_7,
    input wor _id_8
);
  wire [1 : id_8] id_10;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1,
      id_0,
      id_3,
      id_7,
      id_5,
      id_7,
      id_2,
      id_3,
      id_1,
      id_7,
      id_7,
      id_1
  );
  assign modCall_1.id_6 = 0;
  parameter id_11 = -1'b0 && -1;
endmodule
