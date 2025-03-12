// Seed: 2168343930
module module_0 (
    input supply1 id_0,
    output tri id_1,
    output uwire id_2,
    input supply1 id_3,
    output wand id_4,
    input uwire id_5,
    input uwire id_6,
    input wire id_7,
    input tri0 id_8,
    input wire id_9,
    input tri1 id_10
);
  assign id_4 = -1'd0;
endmodule
module module_1 #(
    parameter id_18 = 32'd82,
    parameter id_22 = 32'd87,
    parameter id_4  = 32'd99
) (
    input tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    input supply1 id_3,
    input supply0 _id_4,
    output supply0 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input supply1 id_8,
    output tri1 id_9,
    input tri1 id_10,
    output wor id_11,
    output tri0 id_12,
    output wire id_13,
    output supply1 id_14,
    output tri0 id_15,
    input supply0 id_16,
    input supply1 id_17,
    input wand _id_18,
    input wor id_19
);
  wire [-1 : id_4] id_21, _id_22, id_23;
  assign id_13 = -1;
  xnor primCall (
      id_14,
      id_7,
      id_26,
      id_21,
      id_8,
      id_23,
      id_10,
      id_24,
      id_19,
      id_16,
      id_25,
      id_1,
      id_2,
      id_17,
      id_0,
      id_3
  );
  wire id_24;
  wire [id_18 : id_22] id_25;
  wire id_26;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_13,
      id_10,
      id_11,
      id_0,
      id_0,
      id_2,
      id_2,
      id_10,
      id_7
  );
  assign modCall_1.id_10 = 0;
  assign id_11 = id_21;
endmodule
