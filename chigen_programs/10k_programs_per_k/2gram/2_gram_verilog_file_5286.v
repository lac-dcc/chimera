// Seed: 3062352796
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    output wire id_3,
    output tri0 id_4,
    output wand id_5,
    output supply1 id_6,
    input supply0 id_7,
    input wor id_8,
    output tri0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    input supply1 id_12,
    input tri id_13,
    input tri1 id_14,
    input tri1 id_15,
    input tri0 id_16,
    input wor id_17,
    output supply0 id_18,
    output wire id_19,
    input wor id_20,
    input supply0 id_21,
    input supply1 id_22,
    input tri id_23,
    output supply1 id_24
);
  assign id_4 = id_20;
  always_comb begin : LABEL_0
    $signed(15);
    ;
    SystemTFIdentifier(-1, id_17);
  end
  assign module_1.id_8 = 0;
  assign id_9 = id_16;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_1 = 32'd39,
    parameter id_3 = 32'd12
) (
    output tri1 id_0,
    input  tri0 _id_1,
    input  wire id_2,
    input  wire _id_3
);
  assign id_0 = 1'b0;
  logic id_5 = id_2, id_6;
  final
    id_6 = id_3#(
        .id_3(1),
        .id_2(1 ^ id_0++),
        .id_1(1),
        .id_2(({-1'b0, 1, 1})),
        .id_5(1),
        .id_2(-1),
        .id_2(-1'b0),
        .id_3(1),
        .id_2(1'b0),
        .id_5(1),
        .id_3("")
    );
  generate
    wand [id_3 : id_1] id_7 = -1;
  endgenerate
  assign id_7 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0
  );
  id_8 :
  assert property (@(-1 or 1 or negedge -1'b0) id_2)
  else;
  wire id_9 = id_9;
endmodule
