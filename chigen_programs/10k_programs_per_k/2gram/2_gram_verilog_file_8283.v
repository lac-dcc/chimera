// Seed: 1885066946
module module_0 (
    input wand id_0,
    input tri id_1,
    output wand id_2,
    input wire id_3,
    output uwire id_4,
    input tri1 id_5,
    output supply0 id_6
    , id_17,
    output uwire id_7,
    input supply1 id_8,
    input uwire id_9,
    input wand id_10
    , id_18,
    input tri1 id_11,
    input tri1 id_12,
    input supply0 id_13,
    input supply1 id_14,
    output uwire id_15
    , id_19
);
  assign id_17 = id_18;
  final begin : LABEL_0
    fork
      assert (id_1);
    join
  end
  assign id_18 = 1;
  wire id_20;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd62
) (
    output supply0 id_0,
    input supply1 _id_1
    , id_5,
    output wand id_2,
    input supply1 id_3
);
  wire [id_1  -  1 : -1] id_6;
  assign id_0 = 1'b0;
  logic id_7 = id_5;
  parameter id_8 = 1 < 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign id_2 = id_7 && (~1);
endmodule
