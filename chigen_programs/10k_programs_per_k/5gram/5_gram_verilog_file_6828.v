// Seed: 2232745272
module module_0 (
    output supply0 id_0,
    output wor id_1,
    input wor id_2,
    input wand id_3,
    input wor id_4,
    input tri1 id_5
);
  wire id_7;
endmodule
module module_1 #(
    parameter id_0 = 32'd21,
    parameter id_6 = 32'd19,
    parameter id_8 = 32'd84
) (
    output tri0 _id_0,
    output tri1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri id_5,
    input uwire _id_6,
    output uwire id_7,
    input wire _id_8,
    output supply1 id_9,
    input supply1 id_10,
    output supply0 id_11,
    input supply0 id_12,
    output wor id_13,
    input tri id_14,
    input supply0 id_15
);
  module_0 modCall_1 (
      id_1,
      id_11,
      id_10,
      id_3,
      id_12,
      id_2
  );
  assign modCall_1.id_4 = 0;
  struct packed {
    logic [id_0 : 1 'h0] id_17;
    struct packed {
      id_18 id_19;
      logic [-1 : -1] id_20;
    } [id_6 : -1  &  1  &  1  -  1] id_21;
  } [1 : -1] id_22;
  assign id_22.id_21[id_8] = -1 ? id_22.id_19 : id_5 ? -1'd0 == id_22.id_17 : id_2;
endmodule
