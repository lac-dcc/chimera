// Seed: 1356914906
module module_0 (
    input uwire id_0,
    input wand id_1,
    input supply1 id_2,
    output tri0 id_3,
    input tri0 id_4
);
  assign id_3 = 1'b0;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    output wand id_7,
    output tri id_8,
    output uwire id_9,
    output uwire id_10,
    output wor id_11,
    input wor id_12,
    input uwire id_13,
    output uwire id_14,
    input uwire id_15
);
  supply0 id_17 = id_15;
  reg id_18;
  assign id_17 = 1'b0;
  nand (id_7, id_5, id_6, id_15, id_13, id_12, id_2, id_17, id_19);
  wire id_19;
  module_0(
      id_4, id_13, id_6, id_9, id_1
  );
  wire id_20;
  if (1) always cover (1) id_18 <= 1;
  assign id_14 = id_17;
  wire id_21;
  assign id_9 = 1;
endmodule
