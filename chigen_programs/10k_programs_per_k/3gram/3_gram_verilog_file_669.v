// Seed: 3755357112
module module_0 (
    input wor id_0,
    input tri id_1,
    output tri id_2,
    input wand id_3,
    input wand id_4,
    input supply1 id_5,
    output tri id_6,
    output wor id_7,
    input uwire id_8,
    input supply0 id_9,
    output uwire id_10,
    output wand id_11,
    output tri0 id_12,
    input wor id_13,
    output supply1 id_14,
    input tri0 id_15,
    output supply0 id_16,
    input wand id_17,
    output wand id_18,
    input wand id_19,
    input wire id_20
);
  wire id_22, id_23;
  wire id_24;
  id_25(
      {1}, 1
  );
  wire id_26;
  id_27(
      .id_0(1), .id_1(1), .id_2(id_13)
  );
  wire id_28;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input supply1 id_2,
    output wand id_3,
    output tri id_4
);
  wire id_6;
  nand (id_3, id_2, id_6, id_1, id_0);
  module_0(
      id_2,
      id_0,
      id_3,
      id_1,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_3,
      id_3,
      id_1,
      id_3,
      id_0,
      id_4,
      id_2,
      id_4,
      id_0,
      id_2
  );
endmodule
