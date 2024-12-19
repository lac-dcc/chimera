// Seed: 2553624417
module module_0 (
    input tri id_0,
    input tri id_1,
    input uwire id_2,
    input uwire id_3,
    input wire id_4,
    output supply1 id_5,
    input supply1 id_6,
    output supply0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    output tri0 id_11
);
  supply1 id_13;
  assign id_5 = ~id_2 | id_0;
  supply0 id_14 = {id_13, 1, id_14};
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output wire id_0,
    input wand id_1,
    input tri id_2,
    output supply1 id_3,
    input wand id_4,
    input tri id_5,
    input tri1 id_6,
    output wor id_7,
    inout wand id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_8,
      id_4,
      id_0,
      id_6,
      id_8,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.type_17 = 0;
endmodule
