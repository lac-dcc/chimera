// Seed: 668705816
module module_0 (
    output wand id_0,
    input tri0 id_1,
    output wand id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri id_5,
    input wire id_6,
    input wor id_7,
    input tri0 id_8,
    input supply1 id_9,
    input tri1 id_10,
    input uwire id_11,
    input tri id_12,
    input tri0 id_13,
    input tri id_14
);
  id_16(
      .id_0(""), .id_1(1'b0), .id_2(1), .id_3(1)
  );
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input  wand id_0,
    input  tri0 id_1,
    input  tri1 id_2,
    output wand id_3
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0
  );
  wire id_5;
endmodule
