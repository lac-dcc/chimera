// Seed: 498141945
module module_0 #(
    parameter id_3 = 32'd96
) (
    output wand id_0
);
  logic [7:0][-1 'h0] id_2, _id_3;
  wire [-1  &  1 'b0 : id_3] id_4;
  wire id_5;
  wire [1 : ~  -1 'b0] id_6;
  assign id_6 = 1 ^ id_5;
  assign (strong1, pull0) #1 id_6 = id_4;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    output tri1 id_3
);
  assign id_3 = !1;
  module_0 modCall_1 (id_2);
  assign modCall_1.id_0 = 0;
endmodule
