// Seed: 2891555960
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input tri id_2,
    output wire id_3,
    output uwire id_4,
    input wor id_5,
    output uwire id_6,
    output wand id_7,
    input tri1 id_8,
    input wand id_9,
    output tri0 id_10,
    output tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    input wor id_14,
    input tri id_15,
    input wire id_16,
    input tri0 id_17,
    input tri module_0,
    input wor id_19,
    output supply1 id_20,
    input uwire id_21,
    input tri1 id_22,
    input wire id_23,
    input supply1 id_24,
    input wor id_25,
    input wor id_26,
    input supply1 id_27,
    output tri0 id_28,
    output wor id_29,
    output tri id_30,
    output supply1 id_31,
    input uwire id_32,
    input wor id_33,
    input tri1 id_34,
    output wand id_35
);
  assign id_29 = id_16 == id_8;
  id_37(
      1, id_19, 1
  );
endmodule
module module_1 (
    output tri1 id_0,
    input  tri0 id_1,
    output wor  id_2,
    output tri0 id_3
);
  wire id_5;
  assign id_2 = 1'b0;
  uwire   id_6;
  supply1 id_7;
  assign id_0 = id_6;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_0,
      id_3,
      id_1,
      id_6,
      id_6,
      id_6,
      id_6,
      id_0,
      id_6,
      id_6,
      id_1,
      id_1,
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_0,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6,
      id_1,
      id_0,
      id_0,
      id_6,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.type_21 = 0;
  assign id_0 = 1'b0 - id_7 ? 1 : 1;
endmodule
