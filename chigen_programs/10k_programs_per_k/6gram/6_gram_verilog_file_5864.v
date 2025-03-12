// Seed: 656087234
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input wire id_3,
    output wor id_4
);
  assign id_4 = 1;
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  tri   id_1,
    output logic id_2,
    input  wire  id_3,
    input  tri0  id_4,
    output tri   id_5
);
  initial begin : LABEL_0
    id_2 = -1;
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_1,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    input uwire id_0,
    output tri id_1,
    input supply1 id_2,
    input tri id_3,
    input supply0 id_4,
    output wire id_5
);
  bit id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_2,
      id_5
  );
  always @(posedge -1) begin : LABEL_0
    begin : LABEL_1
      id_7 <= id_4 * -1 - id_7;
      $unsigned(11);
      ;
    end
  end
endmodule
