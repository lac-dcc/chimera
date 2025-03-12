// Seed: 2853633362
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  parameter id_3 = 1'b0;
  logic id_4;
  ;
  logic [-1 'b0 : {  -1  ,  (  -1 'b0 )  }] id_5;
  ;
  always @(negedge id_1 or posedge -1) id_5 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout reg id_6;
  inout logic [7:0] id_5;
  module_0 modCall_1 (
      id_3,
      id_1
  );
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  always @(*) id_6 <= {1, {id_5[-1]{id_6}}, 1'b0} == id_4;
endmodule
