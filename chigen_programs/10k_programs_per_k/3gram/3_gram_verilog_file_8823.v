// Seed: 3454611519
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    output wire id_2,
    input uwire id_3#(
        .id_24(-1 == 1),
        .id_25(""),
        .id_26(1 ? 1 : -1),
        .id_27(1),
        .id_28(1),
        .id_29(-1)
    ),
    input uwire id_4,
    output supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    output wire id_8,
    input supply1 id_9,
    input wor id_10,
    output tri0 id_11,
    output uwire id_12
    , id_30,
    output wand id_13,
    output tri1 id_14,
    input tri id_15,
    input tri id_16,
    input tri0 id_17,
    output tri1 id_18,
    input tri0 id_19,
    output tri0 id_20,
    output supply1 id_21,
    output supply0 id_22
);
  wire id_31;
endmodule
module module_1 #(
    parameter id_3 = 32'd6
) (
    output tri1 id_0,
    output uwire id_1,
    output tri1 id_2,
    output tri0 _id_3,
    input wire id_4,
    input tri0 id_5,
    output tri id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri0 id_9
    , id_11
);
  wire id_12;
  assign id_2 = id_5 - 1;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_1,
      id_9,
      id_7,
      id_1,
      id_8,
      id_8,
      id_2,
      id_8,
      id_9,
      id_0,
      id_6,
      id_2,
      id_1,
      id_9,
      id_7,
      id_7,
      id_0,
      id_7,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_15 = 0;
  always_ff @(id_7 or posedge id_7) id_11 = #1 1;
  logic [1 'b0 : id_3  ?  1 : 1] id_13;
  ;
  final $clog2(55);
  ;
endmodule
