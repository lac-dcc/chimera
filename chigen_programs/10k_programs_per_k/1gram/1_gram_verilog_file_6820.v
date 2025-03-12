// Seed: 2541078781
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output supply1 id_2,
    output supply1 id_3,
    output supply1 id_4,
    input wand id_5,
    input wire id_6
    , id_25,
    input tri1 id_7,
    input wire id_8,
    input tri1 id_9,
    output tri0 id_10,
    input supply0 id_11,
    output tri1 id_12,
    input tri0 id_13
    , id_26, id_27,
    input tri id_14,
    input tri0 id_15,
    input wand id_16,
    input uwire id_17,
    input uwire id_18,
    output tri0 id_19,
    input wor id_20,
    output tri1 id_21,
    input uwire id_22,
    output uwire id_23
);
  assign id_26 = (-1 - 1);
  wire id_28;
  wire id_29;
  wire id_30;
  assign id_25 = 1;
endmodule
module static module_1 #(
    parameter id_6 = 32'd15
) (
    output uwire id_0,
    input  wor   id_1,
    input  wor   id_2,
    output uwire id_3,
    output tri0  id_4 [-1  &  -1 : id_6],
    input  wor   id_5,
    output wand  _id_6
);
  wire id_8;
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_0,
      id_3,
      id_2,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2,
      id_4,
      id_2,
      id_1,
      id_1,
      id_1,
      id_5,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule
