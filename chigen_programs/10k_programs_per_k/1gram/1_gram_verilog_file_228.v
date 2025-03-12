// Seed: 3414621373
program module_0 (
    input wor id_0,
    input tri0 id_1,
    input uwire id_2,
    output uwire id_3,
    input tri id_4,
    output wand id_5,
    output wire id_6,
    output uwire id_7,
    output uwire id_8,
    input uwire id_9,
    input wire id_10,
    input wand id_11,
    output supply1 id_12,
    input supply1 id_13,
    input supply1 id_14,
    input wand id_15,
    output tri0 id_16,
    input tri1 id_17,
    output tri1 id_18,
    output uwire id_19
);
endprogram
module module_1 #(
    parameter id_0 = 32'd31,
    parameter id_3 = 32'd17
) (
    input  tri0 _id_0,
    input  tri1 id_1,
    output tri0 id_2,
    input  wor  _id_3
);
  struct packed {logic id_5[id_3 : id_0];} id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_19 = 0;
  wire id_7 = id_0;
endmodule
