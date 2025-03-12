// Seed: 1171337384
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input uwire id_7,
    input supply0 id_8,
    output tri id_9
);
  assign id_0 = id_8;
  assign id_9 = id_6;
endmodule
module module_1 #(
    parameter id_11 = 32'd61
) (
    output tri0 id_0,
    output uwire id_1,
    input tri0 id_2,
    output tri0 id_3,
    output wand id_4,
    output tri1 id_5,
    output uwire id_6,
    input supply1 id_7,
    input supply1 id_8,
    input supply1 id_9,
    input tri0 id_10,
    output wand _id_11
);
  logic [-1 : id_11] id_13["" : -1 'h0];
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_8,
      id_2,
      id_7,
      id_8,
      id_7,
      id_10,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
