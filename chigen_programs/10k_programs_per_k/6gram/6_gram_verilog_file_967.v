// Seed: 2872877077
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output supply0 id_4,
    output wor id_5,
    output tri id_6,
    input tri id_7,
    input tri0 id_8,
    input tri1 id_9,
    input wor id_10,
    output supply0 id_11,
    input supply0 id_12,
    input wire id_13,
    input wor id_14
    , id_28,
    input supply1 id_15,
    input tri id_16
    , id_29,
    input supply1 id_17,
    input tri id_18,
    input supply0 id_19,
    input supply0 id_20,
    output wire id_21,
    input supply0 id_22,
    input wand id_23,
    input tri id_24,
    output tri0 id_25,
    input supply1 id_26
);
  always force id_29 = -1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output wand  id_2
);
  initial begin : LABEL_0
    $unsigned(98);
    ;
    SystemTFIdentifier(!id_1, -1);
    force id_2 = id_0;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_26 = 0;
endmodule
