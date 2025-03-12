// Seed: 3982075640
module module_0 (
    input  uwire id_0,
    input  tri   id_1,
    output wor   id_2
);
  assign id_2 = -1'h0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    output logic id_3,
    output wire  id_4
);
  always @(posedge id_1 ==? 1 or negedge id_1) begin : LABEL_0
    id_3 <= 1 - 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4
  );
endmodule
module module_2 (
    input supply1 id_0,
    input supply0 id_1,
    output logic id_2,
    input tri id_3,
    output tri id_4
);
  logic id_6;
  ;
  initial id_2 = #1 id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
