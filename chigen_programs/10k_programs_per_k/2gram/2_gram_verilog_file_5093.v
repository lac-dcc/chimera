// Seed: 2130330218
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri id_4,
    output tri1 id_5,
    input wire id_6,
    input wire id_7,
    output tri id_8,
    output wire id_9,
    input uwire id_10,
    input wor id_11,
    output uwire id_12,
    input wor id_13,
    input supply0 id_14,
    input tri0 id_15,
    input supply0 id_16
);
  logic id_18;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1,
    input  wor   id_2,
    input  uwire id_3,
    output tri0  id_4,
    output wand  id_5
);
  initial @(*) id_0 <= id_1;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_1,
      id_2,
      id_5,
      id_3,
      id_3,
      id_5,
      id_5,
      id_3,
      id_1,
      id_5,
      id_3,
      id_3,
      id_2,
      id_1
  );
endmodule
