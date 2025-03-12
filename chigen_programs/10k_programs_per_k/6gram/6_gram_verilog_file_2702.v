// Seed: 1089881067
module module_0 (
    input  tri  id_0,
    input  tri1 id_1,
    output wor  id_2
);
  assign id_2 = 1'b0;
  reg id_4, id_5;
  always @(id_0)
    for (id_4 = (id_1); id_4; id_5 = ~id_1)
      for (id_5 = id_1; -1; id_2 += id_5) id_4 = #1 id_0;
endmodule
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    output logic id_2
);
  wire id_4;
  always @(posedge 1'b0 == -1) begin : LABEL_0
    id_2 = -1;
    $signed(2);
    ;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
