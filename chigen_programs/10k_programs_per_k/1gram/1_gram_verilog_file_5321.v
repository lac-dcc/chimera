// Seed: 2856023397
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input wor id_2,
    input supply1 id_3,
    input wand id_4,
    input tri1 id_5,
    output tri id_6,
    output uwire id_7,
    output tri0 id_8,
    input wire id_9,
    input tri0 id_10,
    output tri id_11,
    input wand id_12,
    input wand id_13,
    input uwire id_14,
    input tri0 id_15
);
  wire id_17, id_18;
  wire id_19;
  wire id_20, id_21, id_22, id_23, id_24;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    output uwire id_2,
    input uwire id_3,
    output wire id_4,
    input wand id_5,
    input supply1 id_6,
    output tri1 id_7
);
  id_9(
      .id_0(1'b0 - ""), .id_1(id_7), .id_2(id_7 << 1'd0)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_5,
      id_3,
      id_7,
      id_0,
      id_0,
      id_6,
      id_1,
      id_0,
      id_5,
      id_1,
      id_3,
      id_1
  );
endmodule
