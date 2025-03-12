// Seed: 1277501131
module module_0 #(
    parameter id_6 = 32'd34
) (
    input wand  id_0,
    input wand  id_1,
    input uwire id_2,
    input tri0  id_3
);
  always #1 $unsigned(32);
  ;
  logic id_5, _id_6;
  assign module_1.id_17 = 0;
  wire id_7, id_8;
  wire [id_6 : -1 'b0] id_9;
  logic id_10;
  ;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input wor id_2,
    output uwire id_3,
    output supply1 id_4,
    output supply0 id_5,
    output wor id_6,
    output tri id_7,
    output uwire id_8,
    input wand id_9
    , id_22,
    output tri id_10,
    input supply0 id_11,
    input tri0 id_12,
    output wire id_13,
    input wor id_14,
    input wand id_15#(
        .id_23(1),
        .id_24(1),
        .id_25(1),
        .id_26(1),
        .id_27(1),
        .id_28(1),
        .id_29(-1)
    ),
    input supply1 id_16,
    input wor id_17
    , id_30,
    input tri1 id_18,
    input supply1 id_19,
    input tri0 id_20
);
  nand primCall (
      id_5,
      id_24,
      id_26,
      id_19,
      id_15,
      id_17,
      id_22,
      id_29,
      id_28,
      id_18,
      id_30,
      id_27,
      id_9,
      id_20,
      id_14,
      id_12,
      id_2,
      id_25,
      id_0
  );
  module_0 modCall_1 (
      id_14,
      id_15,
      id_2,
      id_11
  );
endmodule
