// Seed: 761853553
program module_0 (
    output uwire id_0,
    output tri0 id_1,
    output tri id_2,
    output wor id_3,
    input tri1 id_4,
    input tri id_5,
    output uwire id_6,
    output supply0 id_7,
    output wand id_8,
    input supply1 id_9,
    input tri1 id_10
);
  final $clog2(15);
  ;
  wire id_12;
endprogram
module module_1 #(
    parameter id_8 = 32'd74
) (
    output supply1 id_0,
    output wor id_1,
    output wire id_2,
    output wand id_3,
    output wand id_4,
    input tri id_5,
    output wand id_6,
    input tri0 id_7,
    input tri0 _id_8
);
  logic [-1 : id_8] id_10 = id_5, id_11, id_12, id_13;
  logic id_14;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_6,
      id_3,
      id_7,
      id_7,
      id_2,
      id_4,
      id_4,
      id_7,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
