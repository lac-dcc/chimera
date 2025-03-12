// Seed: 2380916529
module module_0 (
    output tri0 id_0,
    output tri id_1,
    output supply0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wire id_5,
    output supply1 module_0
    , id_16,
    input wor id_7,
    input wor id_8,
    input supply1 id_9,
    input tri1 id_10,
    output uwire id_11,
    output wor id_12,
    input wor id_13,
    input tri1 id_14
);
  logic id_17, id_18, id_19;
  always_comb @(posedge id_4 or posedge 1'b0);
endmodule
module module_1 #(
    parameter id_0 = 32'd91,
    parameter id_7 = 32'd76
) (
    input wor _id_0,
    output tri0 id_1,
    input uwire id_2,
    output wor id_3,
    output uwire id_4,
    input wor id_5,
    input wand id_6,
    input wand _id_7,
    input supply0 id_8,
    input tri1 id_9,
    input wor id_10,
    output supply0 id_11,
    input supply1 id_12,
    output wire id_13,
    output supply1 id_14
);
  assign id_13 = 1'b0 && id_9;
  wor id_16 = 1'b0, id_17;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_3,
      id_5,
      id_9,
      id_12,
      id_1,
      id_8,
      id_10,
      id_9,
      id_9,
      id_11,
      id_11,
      id_8,
      id_8
  );
  assign modCall_1.id_6 = 0;
  logic [id_7 : id_0  ?  -1 : id_7] id_18;
endmodule
