// Seed: 1110113904
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    output tri id_2,
    output uwire id_3,
    output supply0 id_4,
    input wire id_5,
    input tri0 id_6,
    input tri id_7,
    input wand id_8,
    input wor id_9,
    input tri1 id_10,
    input supply1 id_11,
    input tri1 id_12,
    input uwire id_13,
    input supply1 id_14,
    input tri1 id_15
);
endmodule
module module_1 #(
    parameter id_6 = 32'd51
) (
    output uwire id_0,
    input wand id_1,
    input supply1 id_2,
    output tri id_3
    , id_11,
    input supply1 id_4,
    output tri id_5,
    input supply0 _id_6,
    input tri0 id_7,
    input tri0 id_8,
    input supply0 id_9
);
  logic id_12;
  wire [id_6 : -1 'b0] id_13;
  assign id_12 = id_6;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_5,
      id_5,
      id_4,
      id_4,
      id_7,
      id_1,
      id_8,
      id_9,
      id_1,
      id_4,
      id_7,
      id_2,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
