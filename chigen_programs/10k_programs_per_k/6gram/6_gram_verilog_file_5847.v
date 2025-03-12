// Seed: 4125321762
module module_0 (
    input wire id_0,
    output tri1 id_1
    , id_9,
    input supply1 id_2,
    input tri1 id_3,
    input uwire id_4,
    input wand id_5,
    input tri1 id_6,
    output wand id_7
);
  wire id_10;
  parameter id_11 = 1;
  parameter id_12 = (id_11);
  wire id_13;
  wire id_14;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd5,
    parameter id_2 = 32'd1,
    parameter id_6 = 32'd61
) (
    input tri1 _id_0,
    output uwire id_1,
    input supply1 _id_2,
    output tri id_3,
    input wor id_4
    , id_13,
    input wor id_5,
    output wand _id_6,
    input uwire id_7,
    output tri1 id_8,
    input supply1 id_9,
    input wand id_10,
    output wor id_11
);
  logic [id_0 : id_6] id_14[-1  ==  id_2 : -1];
  and primCall (id_8, id_5, id_9, id_13, id_7, id_14, id_10, id_4);
  module_0 modCall_1 (
      id_9,
      id_8,
      id_10,
      id_9,
      id_7,
      id_10,
      id_5,
      id_8
  );
  assign modCall_1.id_4 = 0;
endmodule
