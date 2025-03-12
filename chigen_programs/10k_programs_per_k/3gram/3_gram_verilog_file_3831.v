// Seed: 402281022
module module_0 (
    output supply1 id_0,
    input  supply0 id_1,
    input  supply0 id_2
);
  assign id_0 = -1;
  assign id_0 = -1;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    output wire  id_2,
    input  wor   id_3,
    input  tri0  id_4
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_1 = 0;
  wire id_6;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_4;
  assign #(id_4, 1) id_2 = id_4;
  assign id_3 = id_4;
  assign module_3.id_5 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output reg id_6;
  inout uwire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = 1;
  always_latch @(id_1 or posedge id_5) id_6 = id_2;
  module_2 modCall_1 (
      id_5,
      id_1,
      id_1
  );
  tri [-1  -  1 'b0 : 1] id_7;
  wand id_8;
  if (id_8++) begin : LABEL_0
    assign id_7 = 1'b0;
  end
endmodule
