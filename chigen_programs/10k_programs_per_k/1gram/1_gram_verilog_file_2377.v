// Seed: 2442423761
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input wor id_4,
    input tri1 id_5,
    output wand id_6,
    input supply1 id_7,
    input supply0 id_8,
    input wor id_9,
    output wire id_10
    , id_15,
    input wand id_11,
    output tri id_12,
    input uwire id_13
);
  assign id_12 = id_5;
  assign module_1.type_3 = 0;
  reg id_16;
  id_17(
      1 ? 1 * 1 : 1
  );
  always_comb id_16 = new(1, 1, id_16, 1'b0);
  assign id_12 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output wand id_2,
    input wand id_3,
    output tri0 id_4,
    output wor id_5,
    output wor id_6,
    input tri0 id_7,
    output supply0 id_8,
    output tri id_9
);
  genvar id_11;
  assign id_4 = 1;
  id_12(
      id_11, 1
  );
  assign id_6 = 1;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3,
      id_1,
      id_1,
      id_7,
      id_5,
      id_7,
      id_1,
      id_0,
      id_9,
      id_1,
      id_5,
      id_7
  );
  assign id_9 = id_0;
endmodule
