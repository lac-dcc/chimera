// Seed: 4179831817
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri1 id_2,
    output wand id_3,
    input supply0 id_4,
    output wor id_5,
    input wor id_6,
    output wire id_7,
    input wand id_8
);
  assign id_7 = 1 & 1;
  assign module_2.id_14 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd32
) (
    input  uwire id_0,
    input  tri1  id_1,
    output tri0  id_2
);
  defparam id_4 = id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_2 = 0;
endmodule
module module_2 (
    input  uwire id_0,
    input  logic id_1,
    input  wand  id_2,
    input  tri1  id_3,
    output tri1  id_4,
    input  wor   id_5,
    input  wor   id_6,
    input  tri1  id_7,
    output logic id_8,
    output logic id_9,
    output wor   id_10,
    input  logic id_11
);
  assign id_9 = 1;
  initial begin : LABEL_0
    id_9 <= id_11;
    id_8.id_1 <= 1;
    id_8 <= 1'b0;
  end
  assign id_10 = id_3;
  final id_4 = id_6;
  tri0 id_13;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_4,
      id_2,
      id_4,
      id_7,
      id_10,
      id_6
  );
  supply1 id_14 = id_13;
  assign id_13 = id_1 !== 1;
endmodule
