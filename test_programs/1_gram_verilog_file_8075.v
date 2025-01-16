// Seed: 3161713374
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    input  tri   id_2,
    output tri   id_3
);
  assign {id_1, -1, 1, id_2} = 1;
  always id_0 = id_2 - -1;
  module_2 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_3,
      id_2,
      id_1,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
  parameter id_5 = -1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2
);
  wand id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.type_2 = 0;
  wire id_5;
  always @(id_0 ? -1 == -1 : -1) id_4 = 1;
endmodule
module module_2 (
    input uwire id_0,
    output tri id_1,
    input tri id_2,
    output supply1 id_3,
    input supply1 id_4#(
        .id_10(""),
        .id_11(id_6 >> ""),
        .id_12(1)
    ),
    input supply1 id_5,
    input wire id_6,
    output wor id_7,
    input wire id_8,
    id_13 = 1,
    id_14
);
  always $display(1'b0, 1 == 1, id_4);
  assign id_10 = id_13 | id_0;
  always id_13 = 1;
endmodule
