// Seed: 2936572084
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  assign module_1.id_2 = 0;
  output wire id_1;
  logic id_7;
  ;
  assign id_5 = id_6;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri0 id_5,
    input supply0 id_6,
    input wire id_7,
    output supply0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    output supply0 id_11,
    input uwire id_12,
    output tri id_13,
    output wor id_14,
    output wand id_15,
    output supply0 id_16,
    input wor id_17
);
  logic id_19;
  nand primCall (id_15, id_10, id_9, id_7, id_5, id_4, id_3, id_1, id_12, id_0, id_19);
  assign id_15 = -1;
  logic id_20 = id_19;
  module_0 modCall_1 (
      id_20,
      id_20,
      id_20,
      id_20,
      id_19,
      id_20
  );
endmodule
