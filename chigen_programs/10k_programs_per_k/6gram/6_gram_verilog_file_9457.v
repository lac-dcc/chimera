// Seed: 1082104071
module module_0 (
    output tri0 id_0,
    input  tri  id_1
    , id_3
);
  always_comb begin : LABEL_0
    id_3 = id_1;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd56
) (
    input supply0 _id_0,
    input wand id_1,
    output wire id_2,
    output supply1 id_3,
    input wire id_4,
    input supply0 id_5,
    input supply1 id_6,
    input uwire id_7,
    input supply0 id_8,
    output tri0 id_9,
    output supply1 id_10,
    input tri0 id_11
);
  xor primCall (id_3, id_6, id_8, id_5, id_4, id_1, id_11);
  module_0 modCall_1 (
      id_2,
      id_7
  );
  assign modCall_1.id_3 = 0;
  assign id_9 = id_5;
  assign id_2 = id_7;
  genvar id_13;
  supply1 id_14;
  wand id_15 = id_13;
  assign id_13[id_0] = 1;
  assign id_15 = 1;
  assign id_15 = -1;
  assign id_14 = 1;
  logic id_16;
  always #1 begin : LABEL_0
    id_16 = id_13;
    disable id_17;
  end
endmodule
