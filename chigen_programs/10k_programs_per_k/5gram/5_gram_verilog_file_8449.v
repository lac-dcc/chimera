// Seed: 2321239629
module module_0 (
    output tri1 id_0,
    output wor id_1
    , id_18,
    output supply0 id_2,
    output tri1 id_3,
    input tri1 id_4,
    output wor id_5,
    output supply1 id_6,
    output supply0 id_7,
    input tri0 id_8,
    output supply0 id_9,
    input wor id_10,
    input uwire id_11,
    output wor id_12,
    input uwire id_13,
    output wire id_14,
    input uwire id_15,
    output tri id_16
);
  assign id_2 = 1;
  wire id_19;
  generate
    if (id_4 == id_11) begin : LABEL_0
      for (id_20 = 1; !id_4; id_14 = 1) begin : LABEL_0
        wire id_21;
      end
    end
  endgenerate
  wor id_22 = id_15 >= id_22;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    input  wire  id_2,
    input  wand  id_3,
    input  tri0  id_4,
    input  uwire id_5
);
  wire id_7, id_8, id_9, id_10, id_11, id_12, id_13;
  wire id_14;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_4,
      id_2,
      id_1,
      id_2,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.type_28 = 0;
endmodule
