// Seed: 3785867207
module module_0 (
    input supply1 id_0,
    output tri id_1,
    output supply0 id_2,
    output tri id_3,
    output supply1 id_4,
    input uwire id_5,
    output wand id_6,
    input tri0 id_7,
    input uwire id_8,
    input supply0 id_9,
    input wor id_10
    , id_16,
    input wand id_11,
    output supply1 id_12,
    input uwire id_13,
    output wor id_14
);
  reg  id_17;
  wire id_18;
  always id_17 <= 1 & id_10;
  wire id_19;
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    input supply1 id_2,
    output tri id_3
);
  assign id_3 = 1;
  id_5(
      .id_0(1), .id_1(id_1), .id_2(1)
  );
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3
  );
endmodule
