// Seed: 3935852483
module module_0 (
    output uwire id_0,
    input uwire id_1,
    output tri id_2,
    input supply1 id_3,
    input wire id_4,
    input wire id_5,
    output tri id_6,
    input uwire id_7,
    input wor id_8,
    input wor id_9,
    output uwire id_10,
    input uwire id_11,
    input tri id_12,
    input wand id_13,
    output wire id_14
);
  assign module_1.type_8 = 0;
  assign id_0 = 1;
  wor id_16 = 1'b0;
  supply0 id_17 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    output wand id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6
);
  assign id_2 = id_3;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_3,
      id_5,
      id_3,
      id_4,
      id_1,
      id_5,
      id_5,
      id_0,
      id_1,
      id_6,
      id_6,
      id_2
  );
endmodule
