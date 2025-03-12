// Seed: 2635762858
module module_0 (
    input  wand id_0,
    output tri0 id_1
);
  generate
    for (id_3 = 1 ** id_0; 1; id_3 = id_3) begin : LABEL_0
      wire id_4;
      ;
    end
  endgenerate
endmodule
module module_1 (
    input  tri1  id_0,
    output tri0  id_1,
    input  wor   id_2,
    output logic id_3,
    input  wor   id_4,
    output logic id_5
);
  assign id_3 = -1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  generate
    if (1) begin : LABEL_0
      logic id_7;
      ;
    end else begin : LABEL_1
      wire id_8;
      ;
      always @* begin : LABEL_2
        id_5 = id_0;
        id_3 <= 1;
      end
    end
  endgenerate
endmodule
