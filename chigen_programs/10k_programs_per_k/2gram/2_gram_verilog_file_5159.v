// Seed: 2505776396
module module_0 (
    output wire id_0
);
  integer id_2;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    input tri id_2,
    input supply0 id_3,
    output wor id_4,
    input tri0 id_5
);
  wire id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19;
  module_0 modCall_1 (id_4);
endmodule
macromodule module_2 #(
    parameter id_10 = 32'd87,
    parameter id_20 = 32'd40,
    parameter id_6  = 32'd72
) (
    input supply0 id_0#(
        .id_16(1),
        .id_17(1),
        .id_18(1),
        .id_19(1'b0 - 1)
    ),
    output uwire id_1
    , _id_20,
    input supply0 id_2,
    input wor id_3,
    output tri0 id_4,
    output supply1 id_5
    , id_21,
    output supply0 _id_6,
    input wand id_7
    , id_22,
    output supply1 id_8,
    input tri0 id_9
    , id_23,
    input supply0 _id_10,
    output tri0 id_11,
    output supply1 id_12,
    output tri id_13,
    output tri1 id_14
    , id_24
);
  module_0 modCall_1 (id_13);
  assign modCall_1.id_0 = 0;
  wire id_25;
  assign id_19 = id_18;
  assign id_19 = id_16[1];
  logic [id_10 : id_6] id_26;
  ;
  always_comb id_16[-1+:1&&(id_20==-1)] <= id_17;
endmodule
