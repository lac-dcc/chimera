// Seed: 4284934655
module module_0 (
    output logic id_0,
    input wor id_1,
    output logic id_2,
    input supply0 id_3,
    input tri0 id_4
);
  always_comb @(negedge 1)
    case (1'b0 / 1)
      id_4: id_2 = #1 id_3;
      -1: begin : LABEL_0
        id_0 <= 1 - id_1;
        $unsigned(31);
        ;
        id_2 <= -1;
      end
      id_1: begin : LABEL_1
        id_2 <= id_1;
      end
    endcase
endmodule
module module_1 (
    output logic id_0,
    output wand  id_1,
    input  uwire id_2,
    input  tri1  id_3
);
  final begin : LABEL_0
    id_0 <= #1'b0;
  end
  logic id_5;
  ;
  assign id_5 = 1 < -1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
