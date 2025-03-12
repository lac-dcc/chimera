// Seed: 1683568338
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output tri id_3,
    input supply0 id_4,
    input supply0 id_5,
    output logic id_6,
    input supply1 id_7,
    input uwire id_8,
    input supply1 id_9,
    output wor id_10,
    input wand id_11,
    input supply0 id_12,
    input tri1 id_13,
    output wor id_14,
    input supply1 id_15,
    input tri id_16,
    output logic id_17,
    output supply0 id_18
);
  always begin : LABEL_0
    @(posedge 1 * id_5);
    id_6 = 1;
    id_17 <= -1;
  end
  assign id_6#(
      .id_16(1),
      .id_2 (|1)
  ) = 1;
  logic id_20;
endmodule
module module_1 #(
    parameter id_3 = 32'd90
) (
    input  wor   id_0,
    input  tri0  id_1,
    input  wand  id_2,
    input  tri0  _id_3,
    input  wire  id_4,
    output wor   id_5,
    output wor   id_6,
    output logic id_7,
    output tri0  id_8,
    output tri0  id_9,
    output wand  id_10
);
  final begin : LABEL_0
    id_7 <= id_3;
  end
  module_0 modCall_1 (
      id_10,
      id_0,
      id_1,
      id_9,
      id_1,
      id_0,
      id_7,
      id_1,
      id_1,
      id_1,
      id_8,
      id_2,
      id_2,
      id_1,
      id_9,
      id_4,
      id_4,
      id_7,
      id_8
  );
  assign modCall_1.id_4 = 0;
  wire [1 : id_3] id_12;
  wire id_13, id_14;
  and primCall (id_8, id_1, id_0, id_2);
endmodule
