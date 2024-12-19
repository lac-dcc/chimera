// Seed: 1350946427
module module_0 (
    output wand  id_0,
    input  tri1  id_1,
    input  wor   id_2,
    input  tri1  id_3,
    output wand  id_4,
    output uwire id_5
);
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    input wire id_2,
    input supply1 id_3
);
  supply1 id_5;
  assign id_1 = 'b0;
  always @(negedge 1, posedge 1 & id_3) begin : LABEL_0
    id_5 = id_3;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_5,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.id_3 = 0;
  assign id_0 = id_2;
  wire id_6;
endmodule
