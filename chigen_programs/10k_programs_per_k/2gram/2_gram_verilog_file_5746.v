// Seed: 1164607820
module module_0 (
    output supply0 id_0,
    output wand id_1
    , id_13,
    input wor id_2,
    input wor id_3,
    output wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    input uwire id_7,
    input tri id_8,
    input uwire id_9,
    input supply0 id_10,
    input supply0 id_11
);
  wire id_14, id_15, id_16;
  logic id_17;
  ;
  assign module_1.id_14 = 0;
  genvar id_18;
  assign id_14 = id_5;
endmodule
module module_1 #(
    parameter id_10 = 32'd98,
    parameter id_13 = 32'd25,
    parameter id_14 = 32'd81
) (
    output wire id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wire id_4,
    output wand id_5,
    output tri1 id_6,
    input tri1 id_7,
    output wor id_8,
    input supply0 id_9,
    input tri _id_10,
    input supply1 id_11,
    input tri1 id_12,
    input uwire _id_13,
    input wire _id_14,
    input tri1 id_15,
    input wand id_16
);
  tri [1 : id_14] id_18 = -1;
  nor primCall (id_6, id_3, id_18, id_16, id_12, id_1, id_9);
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_4,
      id_5,
      id_4,
      id_7,
      id_4,
      id_1,
      id_15,
      id_9,
      id_7
  );
  wand [id_10  -  -1 : id_13] id_19 = id_1 - id_7;
  final begin : LABEL_0
    disable id_20;
  end
  assign id_18 = !1'b0;
  wire  id_21 = id_16;
  logic id_22;
  wire  id_23 = id_13;
endmodule
