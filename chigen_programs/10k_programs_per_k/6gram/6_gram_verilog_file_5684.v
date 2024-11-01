// Seed: 3860299068
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output wire id_2,
    input wor id_3,
    output wire id_4,
    input supply0 id_5,
    input tri0 id_6,
    input wire id_7,
    input wand id_8,
    input supply1 id_9,
    output tri0 id_10,
    input uwire id_11,
    output wand id_12,
    output wand id_13
);
  assign id_4  = 1;
  assign id_12 = 1;
endmodule
module module_1 (
    output wire id_0,
    input tri id_1,
    output supply1 id_2,
    output wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wire id_6,
    input wire id_7,
    input wand id_8,
    input tri0 id_9,
    output wor id_10,
    input supply1 id_11,
    input supply0 id_12,
    output supply0 id_13,
    input uwire id_14,
    input tri id_15,
    input wor id_16,
    output tri1 id_17
);
  module_0(
      id_4, id_16, id_17, id_4, id_2, id_16, id_4, id_7, id_11, id_5, id_2, id_15, id_10, id_2
  );
  assign id_2 = 1;
  wire id_19;
  id_20(
      .id_0(1 & id_2 || (1'b0)), .id_1(id_15), .id_2(1)
  );
endmodule
