// Seed: 3887763885
module module_0 (
    input  wand id_0,
    output tri1 id_1
);
  assign id_1 = id_0;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1
);
  assign id_0 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_1 = 32'd60
) (
    _id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire _id_1;
  logic id_4 = 1, id_5[id_1 : -1 'h0 ^  1];
  parameter id_6 = 1;
  logic id_7;
endmodule
module module_3 #(
    parameter id_1 = 32'd32,
    parameter id_2 = 32'd82
) (
    output supply0 id_0,
    output wand _id_1,
    input tri1 _id_2,
    output wor id_3[id_2 : id_1]
);
  assign id_0 = id_2 - !1'b0;
  assign id_1 = id_2;
  parameter id_5#(.id_6(id_5)) = id_5;
  module_2 modCall_1 (
      id_1,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
