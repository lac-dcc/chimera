// Seed: 1631545974
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wire id_5,
    output tri id_6,
    output wor id_7,
    output supply1 id_8,
    input tri1 id_9,
    output uwire id_10,
    input wor id_11,
    output wor id_12
);
  wire id_14;
  id_15(
      .id_0(1'b0), .id_1(id_10), .id_2(id_4 - 1)
  );
  assign id_12 = ~1;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input tri id_2,
    output tri1 id_3,
    input tri id_4,
    input wire id_5,
    input wor id_6,
    input tri id_7,
    input wand id_8,
    input uwire id_9,
    input wor id_10,
    input supply0 id_11,
    input wor id_12,
    input wand id_13,
    input wor id_14,
    input supply0 id_15,
    input supply0 id_16,
    output supply1 id_17,
    output supply0 id_18,
    output tri id_19
);
  wire id_21;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_7,
      id_8,
      id_0,
      id_8,
      id_3,
      id_18,
      id_18,
      id_16,
      id_19,
      id_12,
      id_18
  );
  assign modCall_1.id_4 = 0;
  assign id_18 = id_1 == 1'b0;
  assign id_19 = id_16;
endmodule
