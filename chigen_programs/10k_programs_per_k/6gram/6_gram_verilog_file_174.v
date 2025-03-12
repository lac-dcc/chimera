// Seed: 28125258
module module_0 (
    output tri1 id_0,
    input  wor  id_1,
    input  tri0 id_2,
    output wor  id_3,
    input  wire id_4
);
  supply1 id_6 = id_4 * id_1 - id_1 && -1, \id_7 = \id_7 ;
  assign id_6 = 1 === 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    output uwire id_1,
    input  wire  id_2,
    output tri0  id_3
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_2
  );
  wire id_5;
  logic [7:0] id_6;
  always @(negedge id_5) begin : LABEL_0
    id_6[-1'b0] = -1;
  end
endmodule
