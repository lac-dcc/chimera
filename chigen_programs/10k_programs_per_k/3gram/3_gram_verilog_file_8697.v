// Seed: 3060661646
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wand id_6,
    output supply0 id_7,
    input tri id_8,
    input wire id_9,
    input uwire id_10,
    output tri1 id_11
);
  wire id_13;
  assign id_11 = id_9;
endmodule
module module_1 #(
    parameter id_12 = 32'd16,
    parameter id_13 = 32'd63
) (
    output wand id_0,
    input supply1 id_1,
    input wor id_2,
    output wire id_3,
    output wand id_4,
    output supply0 id_5,
    input tri id_6,
    input supply1 id_7,
    input wire id_8,
    input wor id_9,
    input wire id_10,
    output supply1 id_11,
    input supply1 _id_12,
    input wire _id_13
);
  wire [id_13 : id_12] id_15;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_8,
      id_7,
      id_2,
      id_9,
      id_7,
      id_5,
      id_10,
      id_8,
      id_1,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
