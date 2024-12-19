// Seed: 1111142773
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input uwire id_2,
    input tri1 id_3,
    input tri id_4,
    input wor id_5,
    input tri1 id_6
);
  wire id_8;
  assign module_2.type_0 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output wand id_2
);
  wire id_4;
  generate
    wire id_5;
  endgenerate
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_3 = 0;
  wire id_7;
  wire id_8;
endmodule
module module_2 (
    input tri1 id_0,
    input tri0 id_1,
    output tri0 id_2
    , id_12#(
        .id_13(id_12),
        .id_14(1),
        .id_15(1)
    ),
    output uwire id_3,
    input tri1 id_4,
    output wire id_5,
    output tri id_6,
    output tri0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input tri0 id_10
);
  wire id_16;
  if (1) begin : LABEL_0
    assign id_14 = id_4;
  end else
    id_17 :
    assert property (@(1 - 1) id_13)
    else;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_14,
      id_0,
      id_1,
      id_4,
      id_8
  );
endmodule
