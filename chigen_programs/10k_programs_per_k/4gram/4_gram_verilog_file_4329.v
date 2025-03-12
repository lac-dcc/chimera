// Seed: 3268352463
module module_0 #(
    parameter id_20 = 32'd18
) (
    output tri id_0,
    input wire id_1,
    output wire id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wand id_7,
    output tri0 id_8,
    input wor id_9,
    input supply1 id_10,
    output supply0 id_11,
    output supply0 id_12,
    input uwire id_13,
    output tri id_14,
    input wand id_15
    , id_19,
    output wire id_16,
    input wire id_17
    , _id_20
);
  static logic [1 : -1] id_21;
  ;
  wire id_22;
  struct packed {logic [1 : 1 'h0] id_23;} [id_20 : -1] id_24 = 1'b0, id_25, id_26;
  logic [1 : 1] id_27;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input tri id_3,
    input uwire id_4,
    output supply1 id_5,
    input uwire id_6,
    inout wand id_7,
    input wire id_8,
    input uwire id_9,
    input tri1 id_10,
    input supply0 id_11,
    output supply1 id_12,
    input wire id_13,
    output supply1 id_14,
    input supply0 id_15,
    output wor id_16
);
  assign id_2 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_0,
      id_1,
      id_4,
      id_8,
      id_1,
      id_16,
      id_7,
      id_9,
      id_14,
      id_12,
      id_0,
      id_14,
      id_13,
      id_2,
      id_7
  );
  assign modCall_1.id_12 = 0;
  wire id_18;
endmodule
