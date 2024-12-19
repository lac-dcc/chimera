// Seed: 1179584533
program module_0 (
    output uwire id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri id_5,
    input tri0 id_6,
    input supply1 id_7,
    output wire id_8
    , id_24,
    input wire id_9,
    output wand id_10,
    output tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    output wor id_14,
    input tri0 module_0,
    output supply1 id_16,
    input tri id_17,
    input tri0 id_18,
    output supply0 id_19,
    input supply1 id_20,
    input wor id_21,
    input tri1 id_22
);
  final begin : LABEL_0
    id_1 = id_13;
  end
endprogram
module module_1 (
    output wire id_0,
    output tri id_1,
    output supply0 id_2
    , id_6,
    output uwire id_3,
    input supply0 id_4
);
  and primCall (id_2, id_7, id_6, id_4);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_3,
      id_2,
      id_4,
      id_4,
      id_1,
      id_4,
      id_1,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4
  );
  wor id_8 = 1;
  assign id_2 = 1'b0;
endmodule
