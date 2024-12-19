// Seed: 1443400217
module module_0 (
    output uwire id_0,
    input wire id_1,
    output wand id_2,
    input uwire id_3,
    output wand id_4,
    output supply1 id_5,
    input wire id_6,
    input wire id_7,
    input wor id_8,
    input tri0 id_9,
    output supply1 id_10,
    output supply1 id_11,
    output supply1 id_12,
    output tri id_13,
    output tri id_14,
    input uwire id_15,
    input wire id_16
);
  wire id_18, id_19;
  assign module_1.id_2 = 0;
endmodule
program module_1 (
    output supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    output supply1 id_3,
    input uwire id_4
);
  wire id_6 = 1;
  or primCall (id_0, id_6, id_4, id_2);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_0,
      id_4,
      id_0,
      id_3,
      id_4,
      id_4,
      id_2,
      id_2,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_4,
      id_4
  );
endprogram
