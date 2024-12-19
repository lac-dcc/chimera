// Seed: 1411663195
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output wire  id_3,
    input  wand  id_4,
    output uwire id_5,
    input  tri0  id_6,
    input  tri0  id_7,
    input  tri1  id_8,
    input  tri   id_9,
    input  tri0  id_10
);
  id_12(
      .id_0(), .id_1(id_10), .id_2(1), .id_3(1)
  );
  assign module_1.type_4 = 0;
  supply1 id_13 = 1'd0;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input tri id_6,
    input wor id_7,
    output wor id_8,
    output wire id_9,
    input wand id_10,
    input tri id_11,
    input uwire id_12,
    output uwire id_13,
    output wor id_14,
    input wor id_15,
    output uwire id_16,
    output uwire id_17,
    input tri1 id_18,
    input tri id_19
);
  or primCall (
      id_3,
      id_25,
      id_11,
      id_27,
      id_26,
      id_22,
      id_24,
      id_15,
      id_28,
      id_10,
      id_18,
      id_21,
      id_6,
      id_19,
      id_29,
      id_7
  );
  wand id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_27,
      id_21,
      id_18,
      id_24,
      id_24,
      id_6,
      id_23,
      id_21,
      id_5
  );
  assign id_13 = id_25;
  supply1 id_30, id_31 = id_25 - id_29;
endmodule
