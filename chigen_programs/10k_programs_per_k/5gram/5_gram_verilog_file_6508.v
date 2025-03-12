// Seed: 1938595466
module module_0 (
    output wire id_0,
    output uwire id_1,
    input tri1 id_2,
    input wire id_3,
    input supply1 id_4,
    output tri1 id_5,
    output wire id_6,
    output wand id_7
);
  assign id_0 = id_2;
  generate
    assign id_1 = id_4;
  endgenerate
endmodule
module module_1 #(
    parameter id_4 = 32'd51
) (
    input supply1 id_0,
    input supply1 id_1,
    output tri id_2,
    output tri id_3,
    input uwire _id_4,
    input wire id_5
);
  wire [id_4 : 1] id_7;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
