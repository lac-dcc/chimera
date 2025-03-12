// Seed: 1316545586
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    input tri1 id_3
);
  assign module_2.id_11 = 0;
endmodule : SymbolIdentifier
module module_1 (
    input  tri1  id_0,
    output tri0  id_1,
    input  wand  id_2,
    output tri1  id_3,
    output tri0  id_4,
    input  wire  id_5#(.id_8(1'b0), .id_9(1)),
    output logic id_6
);
  always begin : LABEL_0
    id_6 = id_5;
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_4 = 32'd46,
    parameter id_5 = 32'd90
) (
    output wand id_0,
    input tri0 id_1,
    output tri id_2,
    output wor id_3,
    input tri _id_4,
    input wand _id_5,
    inout supply1 id_6,
    output tri id_7,
    input tri0 id_8,
    output tri1 id_9,
    input wor id_10,
    input tri id_11,
    input tri0 id_12
);
  wire [-1  !==  id_5 : id_4] id_14;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_8,
      id_8
  );
endmodule
