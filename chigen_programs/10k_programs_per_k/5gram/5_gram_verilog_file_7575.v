// Seed: 1354207239
module module_0 (
    output tri id_0,
    input uwire id_1,
    input tri sample,
    input tri1 id_3,
    output uwire id_4,
    input tri1 id_5,
    output wor id_6,
    output supply0 id_7
    , id_16,
    output supply1 id_8,
    output wire id_9,
    input supply1 id_10,
    input tri0 module_0,
    input uwire id_12,
    input uwire id_13,
    input tri1 id_14
);
  wire id_17, id_18 = id_17;
  assign module_1.id_8 = 0;
  logic id_19;
  wire  id_20;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd7
) (
    output wire id_0,
    input uwire id_1,
    input tri id_2,
    output tri0 id_3,
    input supply0 _id_4,
    output tri id_5,
    output uwire id_6,
    input wand id_7,
    input tri id_8,
    input tri1 id_9,
    input tri1 id_10
);
  wire id_12;
  ;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_9,
      id_3,
      id_1,
      id_6,
      id_6,
      id_0,
      id_6,
      id_10,
      id_8,
      id_9,
      id_2,
      id_8
  );
  logic [-1 : id_4] id_13 = -1;
  and primCall (id_3, id_8, id_1, id_7, id_2, id_10, id_9, id_12);
endmodule
