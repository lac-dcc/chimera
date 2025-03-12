// Seed: 3546786931
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input tri id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri0 id_5
);
  wire id_7;
endmodule
module module_1 (
    output supply0 id_0,
    output tri id_1,
    output supply1 id_2,
    output tri0 id_3,
    input tri1 id_4
);
  parameter id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
  assign id_3 = id_6;
endmodule
module module_2 #(
    parameter id_3 = 32'd86
) (
    output uwire id_0,
    input  uwire id_1,
    output wor   id_2,
    input  wire  _id_3
);
  logic id_5;
  ;
  always disable id_6;
  always @(negedge -1 or id_5) id_5 <= "";
  assign id_2 = id_3;
  wire [-1 'b0 : id_3] id_7;
  assign id_6 = id_5;
  wire id_8 = id_5;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
