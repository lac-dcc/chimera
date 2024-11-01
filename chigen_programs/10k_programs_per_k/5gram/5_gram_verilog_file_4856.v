// Seed: 4014586337
module module_0 (
    input uwire id_0,
    output tri id_1,
    output wire id_2,
    input wor id_3,
    input supply0 id_4,
    input wand id_5,
    input uwire id_6,
    input wor id_7,
    output wor id_8,
    input uwire id_9,
    input uwire id_10,
    output uwire id_11
);
  supply0 id_13;
  tri id_14;
  wire id_15;
  assign id_14#(
      .id_10(1),
      .id_5 (~id_13)
  ) = 1 & id_14;
  wire id_16;
  id_17(
      .id_0(id_14), .id_1(1), .id_2(1'b0 - id_9), .id_3(1), .id_4((id_6))
  );
  supply1 id_18 = id_7;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input wor id_2,
    output tri0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input tri0 id_7
    , id_16,
    input wand id_8,
    output supply0 id_9,
    input wand id_10,
    input tri id_11,
    input tri1 id_12,
    input supply1 id_13,
    output tri1 id_14
);
  assign id_16[1'b0] = id_0;
  module_0(
      id_6, id_5, id_14, id_10, id_13, id_2, id_11, id_4, id_14, id_11, id_12, id_1
  );
  wire id_17, id_18, id_19;
  timeprecision 1ps;
endmodule
