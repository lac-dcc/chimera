// Seed: 160340525
module module_0 (
    input tri id_0,
    input wire id_1,
    input supply0 id_2,
    output uwire id_3,
    output tri0 id_4,
    output wand id_5,
    input tri0 id_6,
    input uwire id_7,
    input tri0 id_8,
    input wor id_9
);
  logic [7:0][1  >>>  1] id_11;
  assign id_3 = id_11;
  tri0 id_12 = 1'b0;
  id_13(
      id_11, id_4, id_6
  ); id_14(
      1, id_8
  );
  uwire id_15, id_16;
  assign id_4 = 1;
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    input tri id_2,
    input tri id_3,
    input wand id_4,
    input supply1 id_5
    , id_12,
    output wor id_6,
    input uwire id_7,
    input tri0 id_8,
    input tri1 id_9,
    output supply0 id_10
);
  wire id_13;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_0,
      id_0,
      id_0,
      id_4,
      id_5,
      id_4,
      id_2
  );
  assign modCall_1.type_3 = 0;
  wire id_15;
  initial if (1) id_12 = 1;
endmodule
