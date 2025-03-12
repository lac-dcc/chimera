// Seed: 233634177
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output tri id_2,
    output wand id_3,
    input wire id_4,
    input uwire id_5,
    input tri1 id_6,
    output supply0 id_7,
    output uwire id_8,
    input supply1 id_9,
    output uwire id_10,
    output wand id_11,
    input tri1 id_12,
    output tri1 id_13,
    input supply0 id_14,
    input uwire id_15,
    output wand id_16,
    output tri1 id_17,
    input supply1 id_18,
    input wire id_19,
    output supply1 id_20,
    output supply0 id_21,
    input wor id_22
);
  logic [-1 : -1] id_24;
  ;
  wire id_25;
  assign id_16 = id_4 !== -1'b0;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd93
) (
    input supply1 id_0,
    input wire id_1,
    input wor id_2
    , id_18,
    input wand id_3,
    output wire id_4,
    input supply0 id_5,
    output supply1 id_6,
    input tri0 id_7,
    output tri0 id_8,
    output tri1 id_9,
    input tri0 _id_10,
    input tri id_11,
    input tri id_12,
    output uwire id_13,
    input tri0 id_14,
    output supply0 id_15,
    input wand id_16
);
  wire id_19;
  logic [id_10  &  -1  &  -1 'b0 : 1] id_20 = id_2;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_9,
      id_1,
      id_3,
      id_7,
      id_9,
      id_9,
      id_3,
      id_15,
      id_9,
      id_14,
      id_6,
      id_12,
      id_11,
      id_4,
      id_13,
      id_12,
      id_11,
      id_15,
      id_13,
      id_11
  );
endmodule
