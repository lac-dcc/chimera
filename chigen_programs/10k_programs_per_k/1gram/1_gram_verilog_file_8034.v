// Seed: 1412686002
module module_0 (
    output tri id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input wire id_5,
    input supply1 id_6,
    input supply1 id_7,
    input wor id_8
    , id_14,
    output wor id_9,
    input supply1 id_10
    , id_15,
    input tri1 id_11,
    input uwire id_12
);
  assign id_9 = 1'd0;
  id_16(
      id_14, 1, 1, id_8
  );
endmodule
module module_1 #(
    parameter id_1  = 32'd44,
    parameter id_11 = 32'd69,
    parameter id_5  = 32'd38,
    parameter id_8  = 32'd51
) (
    input supply1 id_0[id_11 : id_8],
    input tri1 _id_1,
    input wor id_2,
    input uwire id_3,
    output wand id_4,
    input tri _id_5,
    input wand id_6,
    output tri0 id_7
    , id_22,
    input uwire _id_8,
    output wire id_9[-1 'b0 : id_1],
    input tri0 id_10,
    input wand _id_11,
    output tri0 id_12,
    output uwire id_13,
    input supply1 id_14,
    input tri1 id_15[id_5 : -1 'b0],
    input supply1 id_16,
    input wire id_17,
    input tri0 id_18,
    output supply0 id_19,
    output wire id_20
);
  wire  id_23;
  logic id_24;
  ;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_4,
      id_15,
      id_2,
      id_17,
      id_15,
      id_14,
      id_17,
      id_9,
      id_16,
      id_3,
      id_10
  );
  assign modCall_1.id_5 = 0;
  assign id_20 = id_17;
endmodule
