// Seed: 1553790450
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output tri1 id_4
);
  logic id_6, id_7;
  wire  id_8;
  logic id_9 = id_7;
  assign id_2 = module_0;
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1,
    output logic id_2,
    output wand  id_3
);
  always @(id_1 or posedge id_1) id_0 = id_1;
  generate
    for (id_5 = id_1; -1'b0 - id_5; id_2 = -1) begin : LABEL_0
      logic ["" : -1] id_6 = -1;
    end
  endgenerate
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_3
  );
endmodule
