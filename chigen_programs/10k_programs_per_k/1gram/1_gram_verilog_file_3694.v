// Seed: 3843292533
module module_0 (
    output tri id_0,
    input supply1 id_1#(.id_9(1)),
    output supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    input supply0 id_5,
    output supply0 id_6,
    input wor id_7
);
  wire id_10;
  localparam id_11 = -1'b0 ^ -1;
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 #(
    parameter id_1 = 32'd80
) (
    output uwire id_0,
    input tri _id_1,
    input supply0 id_2[id_1 : id_1],
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output logic id_6,
    output tri id_7,
    input uwire id_8,
    input tri1 id_9,
    output wor id_10,
    output supply1 id_11,
    output uwire id_12
);
  for (id_14 = id_9; id_2; id_6 = 1 ? 1 : -1) begin : LABEL_0
    assign id_14 = 1;
  end
  tri0 id_15;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_0,
      id_9,
      id_0,
      id_9,
      id_12,
      id_5
  );
  assign modCall_1.id_4 = 0;
  assign id_15 = id_8 - id_15;
  assign id_14 = id_2 || id_14;
endmodule
