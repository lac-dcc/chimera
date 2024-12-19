// Seed: 1342589128
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    output tri id_2,
    input tri1 id_3,
    input tri id_4,
    output wor id_5,
    output tri id_6,
    input wire id_7,
    output wand id_8,
    output wor id_9
);
  wire id_11;
  id_12 :
  assert property (@(id_7) 1)
  else id_0 = 1;
  supply1 id_13 = 1;
  wire id_14;
  wire id_15;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri1 id_1
    , id_5,
    output tri1 id_2,
    input  tri0 id_3
);
  supply1 id_6;
  supply1 id_7 = id_6;
  assign id_5 = id_0;
  assign id_7 = id_0;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_0,
      id_6,
      id_2,
      id_1,
      id_0,
      id_2,
      id_6
  );
  assign modCall_1.id_0 = 0;
  wire id_8 = id_0;
  id_9(
      .id_0(id_3), .id_1(id_6), .id_2(1), .id_3(id_1), .id_4(id_0)
  );
endmodule
