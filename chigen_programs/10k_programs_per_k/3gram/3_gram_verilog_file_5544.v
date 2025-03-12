// Seed: 3699616161
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input tri1 id_2,
    input uwire id_3,
    output supply1 id_4,
    input supply1 id_5,
    output tri0 id_6,
    input supply0 id_7,
    output uwire id_8
);
  logic id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18 = 1, id_19, id_20;
endmodule
module module_1 #(
    parameter id_4 = 32'd96,
    parameter id_5 = 32'd59
) (
    input supply0 id_0,
    output supply0 id_1,
    input supply0 id_2,
    output tri id_3,
    input wire _id_4,
    input supply1 _id_5,
    input wand id_6,
    output tri id_7
);
  tri0 [1 : id_4] id_9;
  wire [(  1  ) : id_5] id_10;
  import id_11::*;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_2,
      id_0,
      id_3,
      id_2,
      id_3,
      id_6,
      id_7
  );
  assign modCall_1.id_17 = 0;
  assign id_9 = 1;
endmodule
