// Seed: 985307088
module module_0 (
    output uwire id_0,
    input  tri0  id_1,
    output wor   id_2,
    input  uwire id_3,
    output wire  id_4
);
  tri id_6 = id_1;
  logic [7:0] id_8;
  assign id_6 = 1;
  assign id_2 = $display(1);
  assign module_1.type_2 = 0;
  tri id_9;
  wor id_10;
  always @(id_9#(.id_8(id_8[1 : (1)])) or posedge id_10) id_6 = id_9;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1,
    output tri   id_2,
    input  wor   id_3,
    input  uwire id_4,
    input  uwire id_5,
    input  tri   id_6
);
  assign id_2 = id_6;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_0,
      id_2
  );
endmodule
