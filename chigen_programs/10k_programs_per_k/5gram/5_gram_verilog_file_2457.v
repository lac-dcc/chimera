// Seed: 870188708
module module_0 (
    output wor id_0,
    input supply0 id_1,
    input tri id_2,
    input tri0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    input wire id_6
    , id_12,
    input wire id_7,
    input tri id_8,
    input tri0 id_9,
    input uwire id_10
);
  initial begin : LABEL_0
    disable id_13;
  end
  wire id_14;
  wire id_15;
  generate
    assign id_15 = id_15;
  endgenerate
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    output wire id_2,
    output uwire id_3
    , id_10,
    output tri1 id_4,
    output wire id_5,
    input tri0 id_6,
    output uwire id_7,
    input wor id_8
);
  wire id_11;
  nand primCall (id_2, id_1, id_8, id_11, id_0, id_6);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_8,
      id_7,
      id_5,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
