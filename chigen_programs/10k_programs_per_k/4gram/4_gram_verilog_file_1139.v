// Seed: 659788823
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output wor id_2,
    output tri0 id_3,
    input wire id_4,
    input wire id_5,
    output tri0 id_6,
    input supply1 id_7,
    input wand id_8,
    input wor id_9,
    input wor id_10,
    input uwire id_11,
    output supply1 id_12,
    input tri1 id_13,
    input wor id_14,
    output tri0 id_15,
    input uwire id_16,
    output wire id_17,
    input wire id_18,
    input tri0 id_19,
    input supply0 id_20
    , id_23,
    input tri1 id_21
);
  logic id_24;
  wire  id_25 = id_11;
  assign id_23 = -1;
endmodule
module module_0 #(
    parameter id_14 = 32'd42,
    parameter id_19 = 32'd60
) (
    output tri id_0,
    output wor id_1,
    input supply1 id_2,
    input tri1 id_3,
    output supply0 id_4,
    input uwire id_5,
    input wor id_6,
    input tri0 id_7,
    output tri0 id_8,
    output tri0 id_9,
    output wire id_10,
    output supply1 id_11,
    input supply1 id_12,
    output supply0 id_13
    , id_23,
    input wor _id_14,
    input supply0 id_15,
    output wor module_1,
    input tri1 id_17,
    input tri1 id_18,
    input supply1 _id_19,
    output wire id_20,
    output wire id_21
);
  wire [id_14 : id_19] id_24;
  module_0 modCall_1 (
      id_7,
      id_17,
      id_21,
      id_8,
      id_3,
      id_3,
      id_4,
      id_12,
      id_15,
      id_18,
      id_12,
      id_12,
      id_9,
      id_7,
      id_3,
      id_8,
      id_12,
      id_1,
      id_12,
      id_17,
      id_3,
      id_6
  );
  assign modCall_1.id_17 = 0;
  assign id_20 = id_14;
  always @* begin : LABEL_0
    disable id_25;
  end
endmodule
