// Seed: 3431242460
module module_0 (
    output wor id_0,
    input wor id_1,
    input wire id_2,
    output tri id_3,
    input tri id_4,
    input wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    output wor id_9,
    input wand id_10,
    input wand id_11,
    output uwire id_12,
    input tri0 id_13,
    input tri1 id_14
);
  wand id_16;
  localparam id_17 = !id_16.product;
  assign module_1.type_14 = 0;
  wire id_18, id_19;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    output logic id_2,
    inout  tri0  id_3,
    input  uwire id_4,
    output tri1  id_5,
    input  tri0  id_6,
    output wor   id_7
);
  wire id_9;
  xor primCall (id_2, id_0, id_11, id_4, id_3, id_1, id_6, id_9, id_12);
  generate
    tri1 id_10 = id_4;
    begin : LABEL_0
      tri1 id_11 = 1;
      wire id_12;
    end
  endgenerate
  final id_2 <= 1;
  assign id_10 = -1;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_3,
      id_7,
      id_1,
      id_4,
      id_4,
      id_6,
      id_1,
      id_7,
      id_0,
      id_1,
      id_5,
      id_6,
      id_10
  );
endmodule
