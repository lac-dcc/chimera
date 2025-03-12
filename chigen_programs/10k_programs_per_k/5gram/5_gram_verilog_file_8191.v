// Seed: 3832326745
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    output wire id_3,
    output supply1 id_4,
    output supply1 id_5,
    output wor id_6,
    output supply0 id_7,
    input tri0 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input tri0 id_11,
    output wand id_12,
    input wire id_13,
    output tri id_14,
    input supply0 id_15,
    input wor id_16,
    output tri id_17,
    input uwire id_18,
    input wand id_19,
    input tri id_20
);
  logic [1 : 1] id_22;
  assign module_1.id_20 = 0;
endmodule
module module_1 #(
    parameter id_17 = 32'd33
) (
    output tri1 id_0,
    input tri id_1,
    input tri0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output wand id_5,
    output wor id_6,
    input uwire id_7,
    input wand id_8,
    input wand id_9,
    input uwire id_10,
    input wire id_11,
    input wand id_12,
    input tri0 id_13,
    input wand id_14,
    output tri1 id_15,
    output tri1 id_16,
    input tri0 _id_17,
    input uwire id_18,
    input wire id_19,
    input uwire id_20,
    input supply1 id_21
);
  wire [id_17  |  1 'd0 : 1] id_23;
  xnor primCall (
      id_16, id_12, id_7, id_1, id_23, id_13, id_19, id_10, id_11, id_14, id_20, id_21, id_9, id_2
  );
  module_0 modCall_1 (
      id_20,
      id_10,
      id_20,
      id_16,
      id_0,
      id_0,
      id_0,
      id_16,
      id_18,
      id_15,
      id_9,
      id_8,
      id_16,
      id_9,
      id_0,
      id_10,
      id_2,
      id_5,
      id_11,
      id_19,
      id_4
  );
endmodule
