// Seed: 164904143
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    input wor id_4,
    input supply0 id_5,
    input wand id_6,
    input tri1 id_7,
    input wor id_8,
    input uwire id_9,
    output supply1 id_10,
    output tri id_11,
    input wor id_12,
    input tri0 id_13,
    output supply1 id_14,
    input wor id_15
);
  wire id_17;
  id_18(
      .id_0(id_5), .id_1(id_0), .id_2(1), .id_3(1'b0)
  );
  assign module_1.id_2 = 0;
  wire id_19;
  wand id_20 = !$display - 1;
  wire id_21;
  wire id_22;
endmodule
module module_1 (
    output wire id_0,
    input  wand id_1,
    input  wor  id_2,
    input  tri0 id_3,
    output tri  id_4,
    output wor  id_5
    , id_7
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_3,
      id_3,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_4,
      id_2,
      id_2,
      id_0,
      id_1
  );
endmodule
