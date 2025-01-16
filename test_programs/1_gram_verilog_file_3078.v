// Seed: 2203985556
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    input supply1 id_4,
    input tri id_5,
    input tri0 id_6,
    input wor id_7,
    output tri0 id_8,
    input wand id_9,
    input wire id_10,
    input wire id_11,
    output tri0 id_12,
    input tri1 id_13,
    output uwire id_14
);
  assign id_12 = id_0;
  final begin : LABEL_0
    id_14 = id_5;
  end
endmodule
module module_1 (
    output wor id_0,
    output tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    input tri0 id_5
);
  assign id_0 = {1, 1, id_2, id_4, 1};
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_0,
      id_5,
      id_3,
      id_5,
      id_4,
      id_0,
      id_5,
      id_3,
      id_2,
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_8 = 0;
  id_8(
      1
  );
  assign id_0 = id_2;
endmodule
