// Seed: 842227530
module module_0 (
    input tri id_0,
    input wand id_1,
    input uwire id_2,
    input uwire id_3,
    input tri0 id_4,
    output wire id_5,
    input wor id_6,
    output tri0 id_7,
    input wand id_8,
    input tri1 id_9,
    output wand id_10,
    input tri0 id_11,
    output tri0 id_12
    , id_16,
    input supply0 id_13,
    input tri1 id_14
);
  initial begin : LABEL_0
    id_12#(.product(1)) = (id_2);
  end
endmodule
module module_1 (
    output tri1 id_0,
    input  tri0 id_1,
    input  wand id_2,
    input  wire id_3,
    input  tri1 id_4
);
  wire id_6, id_7;
  wire id_8, id_9, id_10;
  wire id_11, id_12, id_13;
  or primCall (id_0, id_14, id_12, id_9, id_3, id_2, id_6, id_7, id_13, id_1, id_4, id_10, id_8);
  wire id_14;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_4,
      id_2,
      id_4,
      id_0,
      id_3,
      id_0,
      id_3,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
