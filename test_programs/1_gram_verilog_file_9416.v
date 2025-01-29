// Seed: 2910847122
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input wor id_6,
    output tri0 id_7,
    input supply1 id_8,
    input uwire id_9,
    input wand id_10,
    input tri1 id_11,
    output tri id_12,
    input tri0 id_13,
    id_16,
    input supply1 id_14
);
  assign module_1.id_6 = 0;
  wire id_17;
  id_18(
      id_8, -1
  );
  assign id_12 = 1;
  wire id_19;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input supply0 id_2,
    output wor id_3,
    output tri0 id_4,
    input wor id_5,
    output wire id_6,
    inout wand id_7,
    output tri1 id_8,
    output supply1 id_9,
    input wire id_10,
    output wire id_11
);
  id_13(
      .id_0(id_9),
      .id_1(-1),
      .id_2(-1'b0 | id_3),
      .id_3(id_10),
      .id_4(id_1),
      .id_5({1, id_4}),
      .id_6(-1)
  );
  assign id_6 = -1;
  timeprecision 1ps;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_1,
      id_5,
      id_2,
      id_7,
      id_7,
      id_9,
      id_10,
      id_5,
      id_1,
      id_10,
      id_6,
      id_5,
      id_5
  );
endmodule : SymbolIdentifier
