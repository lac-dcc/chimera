// Seed: 560795968
module module_0 (
    input  tri1 id_0,
    output tri1 id_1,
    input  wand id_2,
    output tri0 id_3,
    output tri0 id_4
);
  assign id_1 = 1;
  assign module_1.id_0 = 0;
  generate
    for (id_6 = 1; (id_6) - id_0; id_3 = id_0) begin : LABEL_0
      wire id_7;
    end
  endgenerate
endmodule
module module_1 (
    output logic id_0,
    output wor   id_1,
    output tri1  id_2
);
  assign id_2 = id_4;
  generate
    for (id_5 = id_4; id_5; id_1 = id_4) begin : LABEL_0
      assign id_5 = 1 ^ id_4;
    end
  endgenerate
  always @(id_5 - "" or posedge 1 == 1) id_0 = #1 1;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_2,
      id_2
  );
endmodule
