// Seed: 1553699238
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output tri id_2,
    output tri id_3,
    input supply1 id_4
    , id_14,
    input supply0 id_5,
    output supply1 id_6,
    output wand id_7,
    input wand id_8,
    input supply1 id_9,
    input wand id_10,
    input wire id_11,
    output wand id_12
);
  wire id_15;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    output wor id_3,
    output supply0 id_4,
    input wor id_5,
    output supply1 id_6,
    output tri0 id_7,
    output supply0 id_8,
    output tri id_9,
    output tri1 id_10,
    input tri1 id_11,
    output supply1 id_12,
    input uwire id_13,
    output tri1 id_14
);
  assign id_8 = 1;
  assign id_4 = 1 & id_1 ? 1 | 1 : 1'h0;
  wire id_16, id_17;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_12,
      id_1,
      id_5,
      id_8,
      id_12,
      id_2,
      id_13,
      id_5,
      id_2,
      id_10
  );
  id_18(
      .id_0(1'b0), .id_1(id_8), .id_2(1'b0)
  );
endmodule
