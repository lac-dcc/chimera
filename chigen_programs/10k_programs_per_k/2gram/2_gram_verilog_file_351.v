// Seed: 2241310644
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input wor id_2,
    input wor id_3,
    output tri1 id_4,
    input tri1 id_5,
    input supply1 id_6,
    input supply1 id_7,
    input wor id_8,
    output wor id_9,
    output supply0 id_10,
    output tri id_11,
    input tri0 id_12,
    output tri0 id_13,
    input tri0 id_14,
    input wire id_15
);
  wire id_17;
  wire id_18, id_19, id_20;
  wire id_21;
  wire id_22;
  id_23 :
  assert property (@(id_12 + id_23 or(id_2)) id_7)
  else;
endmodule
module module_1 #(
    parameter id_0  = 32'd49,
    parameter id_11 = 32'd10,
    parameter id_9  = 32'd28
) (
    input tri _id_0,
    input tri1 id_1,
    output supply1 id_2,
    output wire id_3,
    input supply1 id_4,
    output wor id_5,
    input wor id_6
    , id_15,
    input tri1 id_7,
    output wand id_8,
    output tri _id_9,
    input supply0 id_10,
    output tri0 _id_11,
    input tri1 id_12,
    input uwire id_13
);
  struct packed {logic [1  <<  id_9 : id_0] id_16;} [id_11 : id_9] id_17 = 1'b0;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_4,
      id_6,
      id_8,
      id_7,
      id_13,
      id_4,
      id_13,
      id_2,
      id_5,
      id_2,
      id_10,
      id_2,
      id_13,
      id_4
  );
  assign modCall_1.id_11 = 0;
endmodule
