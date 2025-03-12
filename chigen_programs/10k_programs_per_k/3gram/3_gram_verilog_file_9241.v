// Seed: 1547809692
module module_0 (
    output uwire id_0,
    input  wand  id_1,
    input  tri0  id_2
);
  assign id_0 = id_1;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input wor id_2,
    input tri0 id_3,
    output tri0 id_4,
    input wand id_5
);
  logic id_7;
  ;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_1 = 32'd55
) (
    output tri1  id_0,
    input  tri1  _id_1,
    output wand  id_2,
    output tri   id_3,
    output wand  id_4,
    output wand  id_5,
    input  uwire id_6,
    output wor   id_7
);
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_1 = 0;
  wire [1 : id_1] id_9;
  assign id_9 = id_6;
  wire id_10;
  assign id_2 = 1'b0;
endmodule
