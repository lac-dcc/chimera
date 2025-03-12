// Seed: 639020393
module module_0 (
    input tri id_0,
    input tri id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wor id_4,
    input tri1 id_5,
    input uwire id_6,
    input supply1 id_7,
    input supply0 id_8
    , id_11,
    input wire id_9
);
  assign id_11 = id_1 ? id_5 : 1'b0 - id_3;
endmodule
module module_1 #(
    parameter id_2 = 32'd47,
    parameter id_4 = 32'd29
) (
    input wor id_0,
    input wand id_1,
    input tri _id_2,
    input tri1 id_3,
    input tri1 _id_4,
    input supply1 id_5,
    output tri1 id_6,
    output supply1 id_7,
    output supply1 id_8,
    input wire id_9,
    output wand id_10,
    output supply1 id_11
);
  parameter [-1 : id_4  ==  id_2] id_13 = "";
  assign id_10 = id_1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_9,
      id_9,
      id_1,
      id_3,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule
