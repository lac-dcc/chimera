// Seed: 1946527354
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    output wand id_2,
    input supply0 id_3,
    input tri0 id_4,
    input wand id_5,
    output tri0 id_6,
    input wor id_7,
    output wire id_8
);
  assign id_2 = 0;
  wire id_10;
  assign module_1.type_15 = 0;
  id_11(
      .id_0(id_5), .id_1(1), .id_2(id_7 & 1), .id_3(1), .id_4(1), .id_5(id_3)
  ); id_12(
      .id_0(id_1), .id_1(id_4)
  );
endmodule
module module_1 (
    output tri id_0,
    output wand id_1,
    output wire id_2,
    input wor id_3,
    output supply1 id_4,
    input tri0 id_5,
    input tri0 id_6,
    output wand id_7,
    output wand id_8,
    output wand id_9,
    input tri0 id_10,
    input wire id_11,
    output wor id_12,
    input wand id_13,
    output tri id_14,
    output uwire id_15,
    inout uwire id_16,
    output wire id_17,
    input wand id_18,
    input supply1 id_19,
    output wor id_20
);
  assign id_16 = id_19;
  assign id_17 = id_19;
  assign id_0  = ~id_13 + id_10;
  wire id_22 = id_10;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_19,
      id_11,
      id_19,
      id_4,
      id_11,
      id_17
  );
  assign id_7 = id_22;
endmodule
