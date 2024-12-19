// Seed: 1612799185
module module_0 (
    output uwire id_0,
    input tri id_1,
    output wire id_2,
    input wire id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    output supply0 id_7,
    output uwire id_8,
    input wand id_9,
    output wand id_10,
    input uwire id_11,
    input wand id_12,
    output tri0 id_13,
    output supply1 id_14,
    output wor id_15
);
  assign id_15 = id_12;
endmodule
module module_1 (
    input tri1 id_0,
    output wire id_1,
    input supply1 id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4,
      id_2,
      id_1,
      id_4,
      id_0,
      id_1,
      id_0,
      id_4,
      id_4,
      id_4,
      id_1
  );
  assign modCall_1.type_7 = 0;
  supply1 id_5;
  assign id_5 = 1'b0;
  tri id_6 = 1 ? id_4 : ~id_5;
  assign id_1 = id_0;
  assign id_1 = id_2;
  id_7(
      .id_0(1'b0), .id_1(1), .id_2(1), .id_3({1, id_1, $display(1)})
  );
  wire id_8;
  assign id_6 = id_2;
  wire id_9;
  wire id_10;
endmodule
