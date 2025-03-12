// Seed: 3068185401
module module_0 (
    output wand id_0,
    output uwire id_1,
    input supply1 id_2,
    output tri1 id_3,
    input supply0 id_4,
    output tri1 id_5
);
  logic id_7;
  wire  id_8;
  assign module_1.id_4 = 0;
  initial begin : LABEL_0
    id_7 <= id_4;
  end
  wire id_9;
  localparam id_10 = -1, id_11 = -1, id_12 = id_4, id_13 = 1, id_14 = -1, id_15 = id_11 & id_10;
endmodule
module module_1 #(
    parameter id_8 = 32'd11
) (
    input supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input tri1 id_3
    , id_16,
    input supply1 id_4,
    input tri1 id_5,
    output uwire id_6,
    input supply0 id_7,
    input uwire _id_8,
    input tri id_9,
    output wor id_10,
    input wand id_11,
    input supply0 id_12,
    output wor id_13,
    input wand id_14
);
  logic id_17 = id_5;
  final $clog2(89);
  ;
  wire [-1 : id_8] id_18;
  module_0 modCall_1 (
      id_13,
      id_10,
      id_2,
      id_13,
      id_1,
      id_13
  );
endmodule
