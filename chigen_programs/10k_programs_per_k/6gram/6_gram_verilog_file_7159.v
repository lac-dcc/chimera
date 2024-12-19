// Seed: 4032948940
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input wor id_2,
    output tri0 id_3
);
  assign {id_0} = 1;
  logic [7:0] id_5;
  assign id_5[1] = 1;
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1,
    output logic id_2,
    input  tri0  id_3,
    output wor   id_4
);
  initial begin : LABEL_0
    #(1);
    case (id_1)
      1'b0: id_0 = 1;
      (id_1): id_4 = 1;
      1: id_2 <= 1;
    endcase
    begin : LABEL_0
      assume (1 & id_3 & 1);
    end
    id_0 = #id_6 id_6;
    force id_6 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_4
  );
endmodule
