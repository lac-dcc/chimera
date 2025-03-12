// Seed: 426983751
module module_0 (
    output wire id_0,
    input wire id_1,
    output tri id_2,
    input tri id_3,
    output supply0 id_4,
    input uwire id_5,
    input uwire id_6,
    output supply1 id_7,
    output tri1 id_8,
    input supply1 id_9,
    input tri1 id_10,
    input tri id_11,
    output wand id_12,
    input supply0 id_13,
    output wand id_14,
    output wor id_15
);
  assign id_15 = 'h0;
  parameter id_17 = 1;
  parameter id_18 = id_17;
  uwire id_19 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd9,
    parameter id_1 = 32'd48,
    parameter id_2 = 32'd54,
    parameter id_3 = 32'd70,
    parameter id_4 = 32'd28
) (
    input wor _id_0,
    output uwire _id_1,
    input uwire _id_2,
    input tri1 _id_3,
    output tri _id_4,
    output wire id_5,
    input tri id_6,
    input supply1 id_7,
    input wand id_8
);
  wire id_10;
  integer [id_3 : !  id_1] id_11;
  wire id_12;
  logic [id_0 : id_4] id_13;
  wire id_14;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_5,
      id_8,
      id_5,
      id_8,
      id_6,
      id_5,
      id_5,
      id_6,
      id_8,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5
  );
  assign modCall_1.id_9 = 0;
  id_15 :
  assert property (@(-1) -1)
  else if (1) id_15 = (id_12);
  logic [-1 : id_2] id_16;
  ;
endmodule
