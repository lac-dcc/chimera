// Seed: 1424240708
module module_0 (
    input  uwire id_0,
    output tri0  id_1,
    input  tri   id_2,
    input  wor   id_3,
    output wor   id_4,
    input  uwire id_5,
    input  wire  id_6,
    output wor   id_7,
    input  tri1  id_8
);
  logic [-1 'b0 : 1] id_10;
  initial cover (id_10);
  always id_10 = -1;
  assign module_1.id_1 = 0;
  wire id_11;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri  id_1
);
  assign id_1 = id_0;
  logic id_3;
  ;
  wire id_4;
  if (1'b0) begin : LABEL_0
    assign id_3 = 1'b0;
  end
  logic [1  -  1 : (  1  )] id_5;
  ;
  parameter id_6 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0
  );
  logic [-1 : -1] id_7;
endmodule
