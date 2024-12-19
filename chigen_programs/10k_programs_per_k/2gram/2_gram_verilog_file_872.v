// Seed: 1468797754
module module_0 (
    input  uwire id_0
    , id_6,
    input  wor   id_1,
    input  tri1  id_2,
    input  tri   id_3,
    output wor   id_4
);
  assign id_6 = "" && id_6;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input tri1 id_2,
    output uwire id_3,
    output supply1 id_4,
    input uwire id_5,
    output logic id_6,
    output supply1 id_7,
    input wand id_8,
    input tri id_9,
    input uwire id_10,
    input uwire id_11,
    input wire id_12,
    output wand id_13,
    input tri id_14,
    input tri1 id_15,
    input supply0 id_16,
    input wire id_17,
    input logic id_18,
    output wor id_19,
    output tri0 id_20,
    input wand id_21,
    input supply0 id_22
);
  id_24(
      .id_0(1 - 1), .id_1(id_1), .id_2(1), .id_3(id_17 - id_9), .id_4(1), .id_5(id_11), .id_6(id_19)
  );
  assign id_19 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_5,
      id_19
  );
  always
  fork
    id_6 <= 1;
  join : SymbolIdentifier
  always
    if (id_9) forever disable id_25;
    else #1 id_25 <= id_18;
endmodule
