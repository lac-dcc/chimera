// Seed: 393074692
module module_0 #(
    parameter id_26 = 32'd21
) (
    input supply0 id_0
    , id_19,
    output uwire id_1,
    input wand id_2,
    output wor id_3,
    input uwire id_4,
    output supply1 id_5,
    input tri0 id_6,
    input tri1 id_7,
    output tri0 id_8,
    input uwire id_9,
    output uwire id_10,
    output tri1 id_11,
    input wire id_12,
    input tri1 id_13,
    input tri id_14#(
        .id_20 (-1'b0),
        .id_21 (1),
        .id_22 ({-1, 1, -1'b0} || 1),
        .id_23 (-1),
        .id_24 (-1),
        .id_25 (1),
        ._id_26(1),
        .id_27 ("" == 1),
        .id_28 ("" & 1)
    ),
    output tri0 id_15,
    output supply0 id_16,
    output tri id_17
);
  logic [id_26 : (  1 'h0 )] id_29;
  always $clog2(23);
  ;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    input supply0 id_3,
    input tri1 id_4,
    output wand id_5,
    output tri id_6
);
  assign id_5 = -1'h0;
  assign id_6 = id_3;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_0,
      id_3,
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_0,
      id_0,
      id_4,
      id_2,
      id_1,
      id_6,
      id_6,
      id_5
  );
  assign modCall_1.id_2 = 0;
  integer id_8;
  ;
endmodule
