// Seed: 2950435072
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input wire id_2,
    output uwire id_3,
    output supply0 id_4,
    input tri0 id_5,
    output supply0 id_6
);
  reg id_8;
  assign {1, 1, 1} = id_0;
  always @(negedge "") begin : LABEL_0
    id_8 <= 1'b0;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    output uwire id_1
);
  initial forever id_1 = 1 & 1 & id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1
  );
endmodule
