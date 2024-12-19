// Seed: 2713956372
module module_0 (
    output wand id_0,
    output uwire id_1,
    input tri0 id_2,
    input wand id_3,
    output wire id_4,
    input uwire id_5,
    input uwire id_6,
    input supply1 id_7,
    input supply0 id_8,
    output wand id_9,
    output wire id_10,
    output supply0 id_11
);
  always id_1 = id_5;
  tri1 id_13, id_14;
  wire id_15;
  assign id_11 = id_13 - 1;
  wor id_16;
  assign module_1.type_1 = 0;
  assign id_16 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    output wand id_2,
    input wire id_3,
    inout tri0 id_4,
    output tri1 id_5,
    output tri0 id_6
);
  always_comb $display;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_3,
      id_5,
      id_3,
      id_1,
      id_1,
      id_1,
      id_5,
      id_0,
      id_2
  );
endmodule
