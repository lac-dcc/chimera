// Seed: 3483560649
module module_0 (
    output supply0 id_0
);
  wire id_3, id_4;
  parameter id_5 = id_5;
  tri1 id_6;
  tri0 id_7, id_8;
  wire id_9;
  supply0 id_10;
  always_comb if (id_10) $display(id_2, 1);
  initial @(negedge 1) $display(id_2 & (id_2), id_6);
  id_11(
      .id_0(id_10 - id_8), .id_1(), .id_2(1), .id_3(id_4), .id_4(id_7), .id_5(id_7), .id_6(1)
  );
endmodule
module module_1 (
    input uwire id_0,
    output tri0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wire id_4,
    input tri1 id_5,
    input uwire id_6,
    input supply0 id_7,
    input wand id_8,
    input supply0 id_9
);
  assign id_1 = id_6;
  module_0 modCall_1 (id_1);
  assign modCall_1.id_0 = 0;
  wire id_11, id_12;
  nand primCall (id_1, id_6, id_8, id_0, id_4, id_9, id_5, id_3);
endmodule
