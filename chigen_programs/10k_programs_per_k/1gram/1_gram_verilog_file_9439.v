// Seed: 1534131170
module module_0 (
    output tri0 id_0,
    output wor id_1,
    input tri1 id_2,
    input tri id_3,
    output tri0 id_4,
    output wor id_5,
    input supply0 id_6,
    input tri0 id_7,
    output supply1 id_8,
    input supply0 id_9,
    output tri0 id_10,
    input wand id_11,
    output wire id_12,
    input wire id_13,
    output tri0 id_14,
    input tri1 id_15,
    input uwire id_16,
    input tri0 id_17
);
  assign id_12 = (id_13);
  assign module_1.type_7 = 0;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_19 = 32'd48,
    parameter id_20 = 32'd90,
    parameter id_21 = 32'd54
) (
    input logic id_0,
    input supply0 id_1,
    output wor id_2,
    input tri0 id_3,
    output logic id_4,
    output tri id_5,
    output tri0 id_6,
    input uwire id_7,
    input tri1 id_8,
    input tri1 id_9#(.id_16(id_1 | 1)),
    input supply1 id_10,
    input wor id_11,
    output uwire id_12,
    input tri1 id_13,
    output tri id_14
);
  id_17 :
  assert property (@(id_0) id_10 % 1);
  tri id_18 = 1;
  always id_4 <= id_17;
  defparam id_19 = 1 | 1 == id_11, id_20 = 1, id_21 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_7,
      id_8,
      id_2,
      id_14,
      id_11,
      id_7,
      id_14,
      id_10,
      id_12,
      id_10,
      id_5,
      id_13,
      id_12,
      id_7,
      id_11,
      id_7
  );
endmodule
