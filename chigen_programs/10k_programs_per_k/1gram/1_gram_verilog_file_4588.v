// Seed: 4284282606
program module_0 #(
    parameter id_27 = 32'd18
) (
    output uwire id_0
    , id_19 = !1,
    input tri0 id_1,
    output tri0 id_2,
    output wire id_3,
    output wor id_4,
    input tri0 id_5,
    output wire id_6,
    output supply1 id_7#(
        .id_20 (1),
        .id_21 (1),
        .id_22 (-1),
        .id_23 ((1)),
        .id_24 (-1),
        .id_25 (1),
        .id_26 (1),
        ._id_27(1),
        .id_28 ({1'd0{1}}),
        .id_29 ({1{1}}),
        .id_30 (1),
        .id_31 (-1),
        .id_32 (-1'h0 - 1)
    ),
    output tri id_8,
    input tri0 id_9,
    input tri id_10,
    output wor id_11,
    output tri1 id_12
    , id_33,
    input tri0 id_13,
    input tri0 id_14,
    input wor id_15[1 : (  1  )],
    output wire id_16,
    output tri1 id_17
);
  wire [id_27 : -1] id_34;
  assign module_1.id_6 = 0;
  integer id_35;
endprogram
module module_1 #(
    parameter id_13 = 32'd21
) (
    output supply1 id_0,
    output logic id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri0 id_4,
    input tri0 id_5,
    output tri1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    output tri id_9,
    input tri id_10,
    input uwire id_11
);
  final
    if (1) @(posedge -1'h0 or posedge 1'd0, id_5 > ~-1'b0 or posedge id_3 or posedge 1);
    else id_1 <= id_3;
  assign id_9 = 1;
  assign id_0 = ~&(-1);
  assign id_0.id_2 = (-1) ? id_11 + -1'b0 == ~-1 : -1'b0;
  nor primCall (id_0, id_10, id_7, id_2, id_5, id_15, id_11, id_16);
  logic _id_13;
  always begin : LABEL_0
    id_1 = id_2;
  end : SymbolIdentifier
  wire id_14;
  assign id_14 = id_3;
  assign id_0  = id_7;
  wire id_15;
  ;
  wire id_16;
  ;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_4,
      id_9,
      id_2,
      id_0,
      id_4,
      id_4,
      id_5,
      id_3,
      id_4,
      id_8,
      id_5,
      id_2,
      id_11,
      id_4,
      id_0
  );
  wire [1 : ~  id_13] id_17, id_18;
endmodule
