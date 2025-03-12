// Seed: 293903620
module module_0 (
    output tri id_0,
    output tri0 id_1,
    output tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input wand id_6,
    input supply0 id_7
);
  parameter id_9 = -1'h0 & 1;
  assign module_1.id_8 = 0;
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd57
) (
    input tri1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wand id_4,
    input wire id_5,
    input tri0 id_6,
    input wor id_7
    , _id_10,
    output wand id_8
);
  wire  id_11;
  wire  id_12;
  logic id_13;
  ;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_4,
      id_5,
      id_4,
      id_4,
      id_6
  );
  wire [-1 : !  -1  &  id_10] id_14;
  assign id_8 = id_4;
  xnor primCall (id_8, id_2, id_7, id_13, id_11, id_0, id_3, id_5, id_1, id_4, id_12);
endmodule
