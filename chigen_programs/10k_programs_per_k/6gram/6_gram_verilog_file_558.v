// Seed: 3347434311
module module_0 (
    input wor id_0,
    input supply0 id_1
    , id_13,
    output wire id_2,
    input tri0 id_3,
    input tri1 id_4,
    output tri0 id_5,
    output wire id_6,
    input supply0 id_7,
    input wor id_8,
    input supply0 id_9,
    output supply1 id_10,
    input tri id_11
);
  assign id_13 = id_8;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    input wor id_2,
    input tri id_3,
    output supply1 id_4
);
  assign id_4 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_0,
      id_1,
      id_3,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.type_15 = 0;
  wire id_6;
  supply0 id_7;
  generate
    for (id_8 = 1; id_1; id_8 = 1) begin : LABEL_0
      assign id_0 = id_7;
    end
  endgenerate
endmodule
