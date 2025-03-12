// Seed: 2528165088
module module_0 (
    input uwire id_0,
    output wand id_1,
    input supply0 id_2,
    input wor id_3,
    input wand id_4,
    input tri0 id_5,
    input tri0 id_6#(
        .id_11((-1'b0)),
        .id_12(1),
        .id_13(-1),
        .id_14(1),
        .id_15(1),
        .id_16(1)
    ),
    output tri1 id_7,
    output wor id_8,
    input tri1 id_9
);
endmodule
module module_1 #(
    parameter id_1 = 32'd17,
    parameter id_6 = 32'd66
) (
    input supply1 id_0,
    input tri _id_1,
    input wor id_2[id_6 : 1],
    output wire id_3,
    input tri id_4,
    output logic id_5,
    output tri _id_6,
    output supply1 id_7,
    output wand id_8
);
  assign id_6 = id_2;
  logic [7:0] id_10[id_6 : 1];
  logic id_11;
  ;
  assign id_10[id_1] = -1'h0;
  assign id_11 = 1 & 1;
  always begin : LABEL_0
    id_5 = id_11 + ~|1;
  end
  wire id_12;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_0,
      id_0,
      id_4,
      id_2,
      id_0,
      id_7,
      id_8,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
