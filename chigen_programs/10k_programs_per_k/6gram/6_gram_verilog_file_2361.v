// Seed: 2483137164
module module_0 (
    input  wand id_0,
    input  tri0 id_1,
    input  tri0 id_2,
    input  tri1 id_3,
    output tri0 id_4,
    output wor  id_5
);
  logic [1 : (  -1  )] id_7;
  ;
  assign id_5 = 1 == id_3;
  assign id_7[-1] = (id_7);
  logic id_8;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd74
) (
    input  uwire id_0,
    input  uwire id_1,
    output logic id_2,
    output wor   id_3,
    input  wire  id_4
);
  wire _id_6;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_4,
      id_3,
      id_3
  );
  assign id_3 = 1;
  parameter integer id_7 = -1;
  tri0 id_8;
  wire id_9;
  assign id_8 = 1'd0;
  always @(posedge -1 + -1) begin : LABEL_0
    if (id_7[{id_6{-1}}]) begin : LABEL_1
      id_2 <= #1 -1 ? id_4 !=? 1 : "";
    end
  end
endmodule
