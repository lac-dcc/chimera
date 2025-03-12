// Seed: 2009944565
module module_0 #(
    parameter id_6 = 32'd25
) (
    output uwire id_0
    , _id_6 = -1,
    output tri1 id_1,
    input supply1 id_2,
    input wor id_3
    , id_7,
    input wor id_4
);
  union packed {
    logic id_8;
    id_9  id_10;
  } id_11;
  assign id_6 = id_11[id_6];
  assign id_11.id_10 = id_11.id_8[-1];
  logic id_12;
  ;
  wire id_13, id_14, id_15, id_16, id_17;
  assign id_0 = -1;
endmodule
module module_1 (
    input tri1 id_0,
    output wand id_1,
    input wand id_2,
    input uwire id_3,
    input supply0 id_4,
    output supply0 id_5,
    input wand id_6,
    input tri0 id_7,
    output supply1 id_8,
    output wire id_9,
    input wand id_10,
    input wor id_11,
    input supply1 id_12,
    input tri id_13
);
  assign id_5 = 1 ^ id_4;
  assign id_9 = id_3;
  assign id_5 = id_4;
  and primCall (id_5, id_13, id_3, id_0, id_6, id_10, id_2, id_11, id_7, id_4, id_12);
  module_0 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_7,
      id_13
  );
endmodule
