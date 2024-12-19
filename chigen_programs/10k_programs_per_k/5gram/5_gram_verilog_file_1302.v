// Seed: 709680436
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  generate
    genvar id_8;
    assign {1 * 1'd0 - id_3 ~^ 1, 1} = id_4;
  endgenerate
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input supply1 id_2
    , id_10,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5,
    input tri1 id_6,
    output wand id_7,
    output supply1 id_8
);
  wand id_11 = "" == id_10 | 1 == id_0, id_12;
  final begin : LABEL_0
    id_12 = 1;
  end
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_13,
      id_12,
      id_11,
      id_12,
      id_10
  );
  assign id_8 = id_2;
endmodule
