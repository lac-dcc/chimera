// Seed: 191964617
module module_0 (
    input wor id_0,
    output wand id_1,
    input supply1 id_2,
    input wor id_3,
    input uwire id_4,
    output supply1 id_5,
    output tri1 id_6,
    output wor id_7,
    input wor id_8,
    input supply1 id_9,
    input tri0 id_10,
    output wor id_11,
    output tri0 id_12,
    output wire id_13,
    input wire id_14,
    output wire id_15
);
  assign id_12 = id_3;
endmodule
module module_1 (
    input tri id_0,
    output logic id_1,
    input supply1 id_2
);
  logic id_4;
  assign id_1 = id_4;
  id_5 :
  assert property (@(1) 1);
  always if (id_2) id_1 <= 1;
  assign id_5 = id_0;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_0,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
