// Seed: 651644970
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    output wire  id_2,
    input  tri   id_3,
    input  tri   id_4
);
  reg id_6;
  always @(posedge -1'h0 | id_0) begin : LABEL_0
    id_6 = -1'b0 == id_4;
    id_6 = #id_7 -1'b0;
  end
  assign module_1.id_1 = 0;
  logic [-1 'b0 : (  1  )] id_8;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri0 id_3,
    input wire id_4,
    input wire id_5,
    output wire id_6
);
  logic id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_6,
      id_1,
      id_4
  );
endmodule
