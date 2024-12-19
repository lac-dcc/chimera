// Seed: 4075837080
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    output supply0 id_3,
    output supply1 id_4,
    output supply0 id_5
);
  wire id_7;
  wire id_8, id_9;
  wire id_10;
  id_11(
      .id_0(id_7), .id_1(id_3 * 1)
  );
  uwire id_12;
  supply1 id_13 = 1, id_14, id_15;
  wire id_16;
  tri0 id_17 = id_14;
  wire id_18;
  assign module_1.type_2 = 0;
  assign id_12 = 1;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wor id_2,
    input wire id_3,
    output uwire id_4,
    output tri0 id_5,
    output wire id_6,
    input supply1 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_2,
      id_5,
      id_5
  );
  id_10(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1), .id_4(1), .id_5(id_0 && 1)
  );
endmodule
