// Seed: 4040115677
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    output supply1 id_4,
    input wire id_5,
    input uwire id_6,
    input uwire id_7,
    output wire id_8,
    output supply1 id_9
    , id_20,
    input wor id_10,
    input tri0 id_11,
    output uwire id_12,
    input wand id_13,
    output tri1 id_14,
    input supply0 id_15,
    output tri0 id_16,
    input tri id_17,
    input tri id_18
);
  wire [-1  &  1  !==  -1 : 1] id_21;
  pmos (id_11, 1, id_1, id_14 ^ -1, -1, -1);
endmodule
module module_1 #(
    parameter id_11 = 32'd35
) (
    input wor id_0,
    output tri1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wand id_4,
    input wor id_5,
    input wire id_6,
    input tri0 id_7,
    output tri id_8,
    input wand id_9
);
  assign id_1 = -1;
  wire _id_11;
  id_12(
      id_4, id_6 ? id_3 : id_11, id_7, id_4, id_9, -1
  );
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_8,
      id_8,
      id_2,
      id_6,
      id_6,
      id_1,
      id_8,
      id_3,
      id_9,
      id_8,
      id_3,
      id_8,
      id_9,
      id_8,
      id_7,
      id_4
  );
  assign modCall_1.id_4 = 0;
  logic [1 'b0 : id_11] id_13;
endmodule
