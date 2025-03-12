// Seed: 1621604978
module module_0 (
    output wire id_0,
    output supply1 id_1,
    input wor id_2,
    input wor id_3,
    input wor id_4,
    output wire id_5,
    input tri id_6,
    output uwire id_7,
    input supply0 id_8
);
  assign id_1 = id_6;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd75
) (
    input tri0 id_0,
    input tri1 id_1,
    input uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    input supply1 id_5,
    output tri0 id_6
    , id_17,
    input wor id_7,
    output uwire id_8,
    input tri0 id_9,
    input wire id_10,
    input wand id_11,
    output supply1 id_12,
    output tri1 id_13,
    input uwire _id_14,
    output wire id_15
);
  integer [-1 : id_14] id_18;
  xnor primCall (id_8, id_1, id_3, id_17, id_9, id_5, id_4, id_7, id_10, id_0, id_11);
  module_0 modCall_1 (
      id_6,
      id_8,
      id_3,
      id_5,
      id_1,
      id_15,
      id_0,
      id_12,
      id_2
  );
endmodule
