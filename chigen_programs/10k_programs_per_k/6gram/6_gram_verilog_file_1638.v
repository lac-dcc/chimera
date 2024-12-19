// Seed: 1641401088
module module_0 (
    input supply0 id_0,
    output wire id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri1 id_4,
    input wire id_5,
    output tri0 id_6,
    input wor id_7,
    output tri0 id_8,
    input wand id_9
);
  wire id_11;
  assign module_1.type_1 = 0;
  assign id_1 = id_5 ? id_4 : id_7 ? id_5 : 1;
  wire id_12;
endmodule
module module_1 (
    output wor id_0,
    input tri1 id_1,
    input tri0 id_2,
    input uwire id_3,
    output uwire id_4,
    input wire id_5,
    input wand id_6,
    input supply1 id_7,
    input uwire id_8,
    output uwire id_9,
    output tri id_10,
    output wand id_11,
    output wire id_12,
    input uwire id_13,
    input uwire id_14,
    output wand id_15
);
  wire id_17;
  assign id_10 = 1;
  assign id_12 = id_1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_5,
      id_1,
      id_5,
      id_0,
      id_1,
      id_15,
      id_7
  );
endmodule
