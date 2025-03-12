// Seed: 2450360084
module module_0 (
    input supply1 id_0,
    input wand id_1
);
  assign module_1.id_0 = 0;
  initial begin : LABEL_0
    fork
      id_3;
    join
  end
  generate
    for (id_4 = id_0; (1'b0) - id_1; id_4 = id_4) begin : LABEL_1
      wire  id_5;
      logic id_6;
      ;
      logic id_7 = 1;
    end
  endgenerate
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    output tri0  id_2,
    input  tri1  id_3,
    input  tri1  id_4
);
  always_ff @(posedge 1 or posedge 'b0) begin : LABEL_0
    id_0 = 1;
  end
  always_comb @(posedge -1) begin : LABEL_1
    id_1 <= id_4;
  end
  buf primCall (id_2, id_4);
  module_0 modCall_1 (
      id_3,
      id_3
  );
endmodule
