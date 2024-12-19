// Seed: 1470552656
module module_0 (
    output wor id_0,
    output tri id_1,
    input supply1 void id_2,
    input wire id_3,
    input tri1 id_4,
    input wire id_5,
    output tri1 id_6,
    input supply0 id_7,
    input wand id_8,
    input tri1 id_9,
    input wire id_10,
    input tri1 id_11,
    output uwire id_12,
    input wand id_13,
    input tri1 id_14,
    input wand id_15,
    output wor id_16,
    output tri1 id_17,
    input tri1 id_18,
    input tri0 id_19,
    output supply0 id_20,
    input uwire id_21,
    input wire id_22,
    input tri1 id_23,
    output wand id_24,
    input tri id_25,
    input wand id_26,
    output supply0 id_27,
    input uwire id_28,
    output uwire id_29,
    input uwire id_30,
    output wire id_31
);
endmodule
module module_1 (
    input  wor   id_0,
    output wire  id_1#(1),
    input  uwire id_2,
    input  wand  id_3
);
  wand id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_3,
      id_3,
      id_3,
      id_1,
      id_5,
      id_3,
      id_5,
      id_2,
      id_5,
      id_5,
      id_0,
      id_3,
      id_5,
      id_1,
      id_1,
      id_0,
      id_0,
      id_5,
      id_3,
      id_2,
      id_3,
      id_5,
      id_5,
      id_0,
      id_1,
      id_0,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.type_39 = 0;
  id_6(
      .id_0(id_0), .id_1(1'd0), .id_2(1), .id_3(id_0)
  );
  always id_5 = id_2;
endmodule
