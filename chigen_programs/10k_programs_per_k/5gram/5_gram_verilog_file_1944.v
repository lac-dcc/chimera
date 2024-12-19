// Seed: 4209302077
module module_0 (
    output uwire id_0,
    input wand id_1,
    input tri1 id_2,
    output tri0 id_3,
    input wor id_4,
    output supply1 id_5,
    output wire id_6,
    output wor id_7,
    input supply0 id_8,
    input tri0 id_9,
    output wire id_10,
    input wire id_11,
    output wire id_12,
    output wire id_13,
    input tri0 id_14,
    input wor id_15,
    input tri0 id_16,
    output supply1 id_17,
    input supply0 id_18,
    input supply0 id_19,
    input supply1 id_20
);
  supply1 id_22 = 1'b0 ? 1'h0 : id_19 | id_8;
endmodule
module module_1 #(
    parameter id_20 = 32'd22,
    parameter id_21 = 32'd99
) (
    input tri1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output uwire id_5,
    input tri1 id_6,
    output wire id_7,
    input tri id_8,
    output tri1 id_9,
    input tri id_10,
    output supply1 id_11,
    input tri id_12
    , id_16,
    input uwire id_13
    , id_17,
    input tri0 id_14
);
  always_comb @(posedge id_8 > 1) id_11 = 1 * id_13;
  tri0 id_18 = id_10 == id_3;
  assign id_5 = id_6;
  always @(id_2 or posedge 1) id_9 = 1;
  wand id_19 = id_3;
  module_0 modCall_1 (
      id_19,
      id_10,
      id_6,
      id_5,
      id_0,
      id_7,
      id_7,
      id_9,
      id_2,
      id_3,
      id_9,
      id_13,
      id_19,
      id_7,
      id_4,
      id_10,
      id_4,
      id_7,
      id_10,
      id_8,
      id_14
  );
  assign modCall_1.type_1 = 0;
  defparam id_20.id_21 = id_13 < id_13;
endmodule
