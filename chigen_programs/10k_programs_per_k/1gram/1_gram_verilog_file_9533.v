// Seed: 4186182797
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    output tri0 id_4,
    output wand id_5,
    input wor id_6,
    output supply1 id_7,
    input wor id_8,
    input wor id_9,
    input tri0 id_10,
    output tri1 id_11,
    output wor id_12,
    input tri1 id_13,
    input supply0 id_14
);
  wire id_16;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd26
) (
    output uwire id_0,
    output wor _id_1,
    input supply1 id_2,
    output uwire id_3,
    output wor id_4,
    output supply1 id_5,
    input tri id_6[-1 : id_1],
    output tri id_7,
    output supply1 id_8,
    output supply0 id_9,
    input uwire id_10,
    input tri id_11,
    input supply0 id_12,
    input supply1 id_13,
    output tri1 id_14[-1 'b0 : 1]
);
  assign id_9 = -1;
  assign id_0 = 1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_13,
      id_5,
      id_9,
      id_6,
      id_14,
      id_12,
      id_2,
      id_11,
      id_3,
      id_4,
      id_10,
      id_12
  );
  assign modCall_1.id_2 = 0;
  logic id_16 = $clog2(94);
  ;
endmodule
