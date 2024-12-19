// Seed: 411450078
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    input wor id_6,
    input supply0 id_7,
    input wor id_8,
    input wire id_9,
    output wand id_10,
    output tri id_11
);
  uwire id_13;
  wire  id_14;
  wire  id_15;
  wire  id_16;
  uwire id_17;
  assign module_1.type_8 = 0;
  tri1 id_18 = 1;
  tri  id_19 = 1;
  assign id_13 = 1;
  wire id_20;
  assign id_14 = id_20;
  assign id_19 = id_17;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri id_3,
    input uwire id_4
);
  id_6(
      .id_0(1'b0), .id_1(!id_3), .id_2(id_4)
  );
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_1,
      id_2,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_3,
      id_0
  );
  wire id_7;
endmodule
