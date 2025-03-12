// Seed: 2799528398
module module_0 (
    input uwire id_0,
    input wire id_1,
    input tri1 id_2,
    input wire id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri id_6,
    input wor id_7,
    output wand id_8,
    output tri0 id_9,
    output wor id_10,
    input supply0 id_11,
    output wand id_12,
    input supply1 id_13,
    input supply1 id_14,
    output tri1 id_15
);
  assign id_8 = 1 / id_4;
  assign module_1.id_16 = 0;
  tri id_17 = -1'b0;
endmodule
macromodule module_1 #(
    parameter id_0  = 32'd78,
    parameter id_14 = 32'd65,
    parameter id_4  = 32'd77
) (
    input tri _id_0,
    input supply1 id_1,
    input tri id_2,
    input tri0 id_3,
    input uwire _id_4,
    output tri0 id_5,
    input tri0 id_6,
    output tri id_7,
    input tri0 id_8
);
  wire id_10 = !id_8;
  wire id_11, id_12;
  logic [7:0] id_13;
  wire _id_14;
  tri [1 : id_0] id_15, id_16, id_17, id_18;
  localparam id_19 = 1 && -1'b0;
  assign id_13[id_4==1'b0 : id_14] = id_18;
  assign id_18 = 1'h0;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_1,
      id_3,
      id_3,
      id_6,
      id_7,
      id_2,
      id_7,
      id_7,
      id_7,
      id_1,
      id_5,
      id_3,
      id_8,
      id_7
  );
endmodule
