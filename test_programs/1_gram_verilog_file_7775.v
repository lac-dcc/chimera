// Seed: 1351114691
module module_0 (
    input wand id_0,
    output supply0 id_1,
    output tri1 id_2,
    input uwire id_3,
    output tri1 id_4,
    output tri id_5,
    input uwire id_6,
    output tri id_7,
    input wor id_8,
    id_13,
    output supply1 id_9,
    input supply1 id_10,
    output wire id_11
);
  generate
    logic [7:0][-1] id_14 (
        .id_0(id_6),
        .id_1(id_11),
        .id_2(-1),
        .id_3(-1),
        .id_4(1'b0),
        .id_5(1),
        .id_6(),
        .id_7(id_10)
    );
  endgenerate
  assign id_4 = id_8;
  wire id_15;
  wire id_16;
endmodule
program module_1 (
    input tri id_0,
    input wor id_1
);
  uwire id_3 = id_1, id_4, id_5;
  always_ff $display(id_3 == (id_3) - -1, id_1);
  supply0 id_6 = 1 & id_0;
  parameter id_7 = 1;
  assign id_3 = -1'b0;
  assign id_6 = -1 <= -1'b0;
  wire id_8;
  tri1 id_9 = id_0 - id_8, id_10 = id_3 && 1;
  assign id_6 = -1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_1,
      id_5,
      id_3,
      id_1,
      id_5,
      id_1,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.type_4 = 0;
endmodule
