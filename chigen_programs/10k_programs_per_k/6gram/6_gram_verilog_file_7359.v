// Seed: 2103925287
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wor id_5,
    input wire id_6,
    input wand id_7,
    input supply1 id_8,
    output tri id_9,
    input wor id_10,
    output tri1 id_11,
    input tri id_12,
    input wand id_13,
    output supply1 id_14
);
  assign id_11 = 1'h0;
endmodule
module module_1 #(
    parameter id_16 = 32'd57,
    parameter id_4  = 32'd81,
    parameter id_7  = 32'd93
) (
    output wand id_0,
    output wand id_1,
    input wand id_2,
    input wire id_3,
    input supply0 _id_4
    , id_15,
    input supply1 id_5,
    output wand id_6,
    input wand _id_7,
    input tri id_8,
    input tri id_9,
    input supply0 id_10,
    input wor id_11,
    output tri id_12,
    input wor id_13
);
  logic [1 : 1] _id_16 = 1;
  nand primCall (id_0, id_15, id_9, id_2, id_17, id_5, id_13, id_3, id_10, id_8);
  wire [id_4  |  -1  |  id_16  |  1 'b0 : id_7] id_17;
  assign (pull1, weak0) id_15 = ~id_3;
  assign id_6 = -1 - id_8;
  assign id_12 = 1'b0 ** id_17;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_5,
      id_9,
      id_0,
      id_9,
      id_5,
      id_13,
      id_2,
      id_1,
      id_10,
      id_0,
      id_2,
      id_13,
      id_0
  );
  assign modCall_1.id_14 = 0;
endmodule
