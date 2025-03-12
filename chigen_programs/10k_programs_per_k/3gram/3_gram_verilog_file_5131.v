// Seed: 2116281362
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input wand id_3,
    input wand id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    input uwire id_9,
    input tri1 id_10,
    input wire id_11,
    input tri id_12,
    input tri1 id_13#(
        .id_22(1),
        .id_23(-1)
    ),
    input tri0 id_14,
    input tri id_15,
    output supply1 id_16,
    output wire id_17,
    output supply0 id_18,
    input uwire id_19,
    output uwire id_20
);
  always assign id_2 = id_1;
  wire id_24;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd4,
    parameter id_9 = 32'd28
) (
    output wand _id_0,
    output uwire id_1,
    output tri id_2,
    input wire id_3,
    output uwire id_4,
    input uwire id_5,
    input tri1 id_6,
    output uwire id_7,
    input wand id_8,
    output supply1 _id_9,
    output supply1 id_10,
    output tri id_11
);
  logic [id_9 : id_0  -  -1] id_13;
  xor primCall (id_11, id_6, id_8, id_13, id_5, id_3);
  module_0 modCall_1 (
      id_1,
      id_6,
      id_10,
      id_8,
      id_6,
      id_5,
      id_5,
      id_5,
      id_8,
      id_5,
      id_8,
      id_8,
      id_5,
      id_3,
      id_3,
      id_8,
      id_11,
      id_2,
      id_1,
      id_6,
      id_11
  );
endmodule
