// Seed: 1959119982
module module_0 (
    input  tri0  id_0,
    input  wire  id_1,
    input  wor   id_2,
    input  tri   id_3,
    input  wand  id_4,
    input  wand  id_5,
    input  uwire id_6,
    output tri0  id_7
);
  logic id_9 = 1;
  always @(negedge ~id_2) begin : LABEL_0
    disable id_10;
  end
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    output tri id_2,
    output logic id_3
);
  parameter id_5 = 1;
  assign id_2 = -1 - id_5;
  wire [-1 : 1] id_6;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_9 = 0;
  initial
    #(1) begin : LABEL_0
      id_3 <= -1'b0;
    end
endmodule
