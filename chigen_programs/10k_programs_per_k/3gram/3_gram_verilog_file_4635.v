// Seed: 3288334648
module module_0 #(
    parameter id_7 = 32'd88
) (
    output tri1  id_0,
    input  tri0  id_1,
    output uwire id_2,
    output wire  id_3,
    output tri0  id_4,
    input  uwire id_5
);
  logic _id_7;
  wire [1 'b0 : id_7] id_8;
  assign id_4 = (1);
  wire id_9;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd86
) (
    output tri1 _id_0,
    output wor  id_1,
    input  tri1 id_2,
    output wand id_3,
    output tri0 id_4
);
  logic [id_0 : 1] id_6;
  ;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2
  );
endmodule
