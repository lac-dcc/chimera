// Seed: 3952432975
module module_0 (
    input wor id_0,
    input wand id_1,
    input supply1 id_2,
    input tri id_3,
    input tri0 id_4
    , id_22,
    input tri id_5,
    input wand id_6,
    input tri id_7,
    input supply1 id_8,
    input wire id_9,
    output wor id_10,
    output supply1 id_11,
    input wand id_12,
    output wire id_13,
    input uwire id_14,
    input tri0 id_15,
    input tri0 id_16,
    input supply1 id_17,
    input tri0 id_18,
    input tri1 id_19,
    output wor id_20
);
  assign id_22 = -1 == 1'b0;
endmodule
module module_1 (
    output uwire id_0,
    input wire id_1,
    input supply0 id_2,
    input logic id_3,
    inout wire id_4,
    inout logic id_5,
    input wand id_6,
    input wor id_7,
    output uwire id_8,
    input supply1 id_9,
    output wand id_10,
    input wor id_11,
    input supply0 id_12,
    input uwire id_13,
    output supply0 id_14,
    input tri id_15
);
  always id_5 <= id_3;
  nor primCall (id_14, id_15, id_2, id_3, id_4, id_9, id_13, id_17, id_5, id_7, id_11, id_6, id_1);
  id_17(
      1, id_9 - id_2
  );
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_12,
      id_1,
      id_4,
      id_13,
      id_12,
      id_2,
      id_7,
      id_4,
      id_14,
      id_4,
      id_0,
      id_1,
      id_12,
      id_2,
      id_7,
      id_15,
      id_4,
      id_14
  );
  assign modCall_1.id_14 = 0;
endmodule
