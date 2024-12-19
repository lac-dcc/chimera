// Seed: 387611619
module module_0 (
    output tri   id_0,
    input  uwire id_1,
    output tri1  id_2,
    output tri   id_3,
    output wor   id_4,
    input  tri0  id_5,
    output tri   id_6
);
  assign id_2 = id_1;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    output wire id_2,
    input wand id_3,
    output supply0 id_4,
    output tri id_5,
    input logic id_6
);
  logic id_8;
  logic id_9;
  logic id_10 = 1;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4,
      id_4,
      id_4,
      id_1,
      id_0
  );
  assign modCall_1.id_5 = 0;
  wire id_11;
  always @(id_8 or negedge id_8)
    case (id_9)
      id_10: id_2 = 1;
      id_9:  id_8 = id_6;
      1: begin : LABEL_0
        id_8 <= 1;
      end
    endcase
endmodule
