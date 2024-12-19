// Seed: 252128076
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(
        .id_6 (1),
        .id_7 (1 << id_6 & 1),
        .id_8 (1'b0),
        .id_9 (1),
        .id_10(1),
        .id_11(!1),
        .id_12((id_10)),
        .id_13(id_11)
    ),
    id_14,
    id_15
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_16;
  tri1  id_17  =  id_11  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    output wand id_2,
    input wire id_3,
    input wor id_4,
    output wire id_5,
    input tri0 id_6,
    output wire id_7,
    output wand id_8,
    input supply1 id_9
    , id_12,
    input tri0 id_10
    , id_13
);
  module_0 modCall_1 (
      id_12,
      id_12,
      id_13,
      id_13,
      id_12,
      id_13,
      id_12
  );
  assign modCall_1.id_24 = 0;
endmodule
