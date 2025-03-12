// Seed: 4170399987
program module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri id_3,
    output tri0 id_4,
    output wand id_5,
    output wor id_6,
    output tri0 id_7,
    output tri1 id_8
);
  assign module_1.id_14 = 0;
endprogram
module module_1 #(
    parameter id_24 = 32'd23
) (
    input supply1 id_0,
    output tri id_1,
    output tri id_2,
    output uwire id_3,
    input wand id_4,
    inout tri0 id_5#(
        .id_22 (-1),
        .id_23 (1),
        ._id_24(1),
        .id_25 (1),
        .id_26 (1),
        .id_27 (1)
    ),
    input supply0 id_6,
    input uwire id_7,
    output supply0 id_8,
    input wor id_9,
    output wand id_10,
    output logic id_11,
    output supply1 id_12,
    input supply1 id_13,
    input uwire id_14,
    input tri0 id_15,
    input supply0 id_16,
    input wor id_17,
    input tri0 id_18,
    output tri id_19[id_24 : (  1  )],
    input supply1 id_20
);
  always id_11 = (-1'b0);
  module_0 modCall_1 (
      id_5,
      id_6,
      id_5,
      id_5,
      id_8,
      id_2,
      id_2,
      id_8,
      id_19
  );
endmodule
