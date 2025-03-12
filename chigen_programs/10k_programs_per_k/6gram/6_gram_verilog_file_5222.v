// Seed: 2501970202
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input wor id_2,
    output tri0 id_3,
    input tri1 id_4,
    output wand id_5,
    output wand id_6,
    output wor id_7
);
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output tri id_2
);
  wire id_4;
  integer id_5;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  wire id_6;
  ;
endmodule
module module_2 #(
    parameter id_0 = 32'd4,
    parameter id_3 = 32'd14
) (
    input  tri0 _id_0,
    output wand id_1,
    input  tri0 id_2,
    input  tri  _id_3
);
  logic [-1 : 1 'b0] id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
  reg [ -1 'b0 : id_0] id_6;
  bit [1 : 1  ^  id_3] id_7;
  always @(1) begin : LABEL_0
    id_6 <= id_2 - id_0;
    id_7 <= 1;
  end
endmodule
