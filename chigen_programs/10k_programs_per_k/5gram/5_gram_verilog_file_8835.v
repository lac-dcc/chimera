// Seed: 950651886
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    input tri0 id_3,
    output wire id_4,
    output wand id_5,
    input supply1 id_6,
    input wor id_7,
    input wire id_8,
    output tri id_9,
    input wire id_10
);
  assign id_5 = id_10;
  wire id_12;
endmodule
module module_1 #(
    parameter id_0 = 32'd83,
    parameter id_4 = 32'd99,
    parameter id_6 = 32'd77
) (
    input tri1 _id_0,
    input supply0 id_1,
    input wire id_2,
    output tri id_3,
    input supply1 _id_4,
    input wand id_5,
    input tri1 _id_6,
    output wire id_7,
    output supply0 id_8
);
  wire [id_0  -  id_4 : id_6] id_10;
  assign id_3 = id_0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_2,
      id_7,
      id_3,
      id_5,
      id_1,
      id_2,
      id_7,
      id_1
  );
  assign modCall_1.id_0 = 0;
  logic id_11;
  ;
endmodule
