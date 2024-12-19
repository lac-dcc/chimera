// Seed: 2592299666
module module_0 (
    input tri id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input uwire id_4,
    output tri1 id_5,
    input tri0 id_6,
    input wire id_7,
    output tri1 id_8,
    input tri0 id_9
    , id_13,
    output supply0 id_10,
    input supply1 id_11
);
  wire id_14;
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    output tri0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    output supply0 id_8
);
  wire id_10;
  always_comb begin : LABEL_0
    if (1'b0 == id_6) id_8 = 1;
  end
  module_0 modCall_1 (
      id_10,
      id_10,
      id_1,
      id_6,
      id_4,
      id_5,
      id_6,
      id_10,
      id_10,
      id_6,
      id_1,
      id_0
  );
  assign modCall_1.type_0 = 0;
  assign id_2 = id_10;
  wire id_11;
  wire id_12;
  wire id_13, id_14;
endmodule
