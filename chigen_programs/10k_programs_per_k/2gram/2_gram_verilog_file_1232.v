// Seed: 255214560
module module_0 (
    output wire id_0,
    input wand id_1,
    input tri id_2,
    input uwire id_3,
    input uwire id_4,
    output wor id_5,
    output wor id_6,
    input supply0 id_7,
    input supply1 id_8,
    input wand id_9,
    input supply1 id_10,
    input supply0 id_11
);
  wire id_13;
  assign id_0 = 1;
  assign module_1.type_5 = 0;
  wire id_14;
  id_15(
      .id_0(1), .id_1(id_9), .id_2(""), .id_3(id_6), .id_4(1'b0), .id_5(), .id_6(), .id_7(1)
  );
  assign id_14 = id_13;
endmodule
module module_1 (
    output tri1 id_0,
    input  wire id_1,
    input  wire id_2
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule
