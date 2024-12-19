// Seed: 3964301671
module module_0 (
    input  logic id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    output logic id_3,
    output uwire id_4
);
  always @(negedge "") begin : LABEL_0
    #1 begin : LABEL_0
      if (1) id_3 <= 1;
    end
    id_3 <= id_0;
  end
  wire id_6;
endmodule
module module_1 (
    output supply0 id_0,
    output supply1 id_1,
    input tri id_2,
    output logic id_3,
    output wor id_4,
    input wire id_5,
    input supply0 id_6,
    output wor id_7,
    output supply1 id_8,
    input wor id_9,
    input tri id_10,
    input uwire id_11,
    input logic id_12
);
  always_comb @(*) begin : LABEL_0
    id_3 = id_12;
    id_3 <= 1'b0;
  end
  module_0 modCall_1 (
      id_12,
      id_5,
      id_6,
      id_3,
      id_8
  );
  assign modCall_1.type_2 = 0;
endmodule
