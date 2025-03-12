// Seed: 3454087718
module module_0 (
    output tri id_0,
    input tri1 id_1,
    output supply0 id_2,
    input tri id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input tri1 id_7,
    input supply0 id_8,
    output supply1 id_9,
    input tri0 id_10,
    input tri0 id_11,
    output supply1 id_12,
    output uwire id_13,
    output supply1 id_14,
    output wor id_15,
    output wand id_16,
    input supply0 id_17
    , id_25,
    output supply1 id_18,
    output wor id_19,
    input wire id_20,
    input tri0 id_21,
    input tri1 id_22,
    input supply1 id_23
);
  wire id_26;
  tri  id_27 = -1'b0;
  assign module_1.id_6 = 0;
endmodule
macromodule module_1 #(
    parameter id_11 = 32'd62,
    parameter id_7  = 32'd82
) (
    input wor id_0,
    output supply1 id_1,
    output wor id_2,
    input wor id_3,
    output tri1 id_4,
    input uwire id_5,
    output wire id_6,
    input uwire _id_7,
    input tri id_8,
    input tri id_9
    , id_16,
    input supply1 id_10,
    input supply1 _id_11,
    output supply1 id_12,
    input tri0 id_13,
    input wire id_14
);
  wire [id_7 : 1  ?  id_11 : -1] id_17;
  wire id_18;
  always @(posedge id_10) if (1) id_16 <= -1;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_4,
      id_10,
      id_14,
      id_3,
      id_8,
      id_3,
      id_0,
      id_12,
      id_13,
      id_8,
      id_6,
      id_12,
      id_1,
      id_12,
      id_2,
      id_5,
      id_1,
      id_6,
      id_8,
      id_14,
      id_8,
      id_3
  );
endmodule
