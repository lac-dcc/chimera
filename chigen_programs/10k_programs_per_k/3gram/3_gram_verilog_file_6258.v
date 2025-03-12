// Seed: 461044161
module module_0 (
    output supply0 id_0,
    output tri id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri id_4,
    input wire id_5,
    output uwire id_6,
    input wand id_7,
    output wire id_8,
    input tri1 id_9,
    output uwire id_10,
    input supply1 id_11,
    input supply1 id_12
    , id_21,
    output wire id_13,
    output tri0 id_14,
    input wand id_15,
    input wire id_16,
    output tri id_17,
    output tri1 id_18,
    output tri1 id_19
);
  wire id_22;
  ;
  wire id_23;
  wand id_24 = {-1, id_12} - id_5;
endmodule
module module_1 #(
    parameter id_2 = 32'd76
) (
    input tri id_0,
    output supply0 id_1,
    input wire _id_2,
    input tri0 id_3,
    input wor id_4,
    output wand id_5,
    input wire id_6,
    input tri1 id_7,
    input tri id_8,
    input tri0 id_9,
    output tri id_10,
    output tri0 id_11,
    output wire id_12,
    output tri id_13,
    input uwire id_14,
    input wor id_15,
    output tri0 id_16,
    output tri0 id_17,
    output supply1 id_18
);
  wire [id_2 : 1] id_20;
  module_0 modCall_1 (
      id_18,
      id_10,
      id_12,
      id_9,
      id_0,
      id_3,
      id_17,
      id_9,
      id_18,
      id_3,
      id_18,
      id_15,
      id_15,
      id_10,
      id_11,
      id_9,
      id_4,
      id_12,
      id_11,
      id_10
  );
  assign modCall_1.id_16 = 0;
endmodule
