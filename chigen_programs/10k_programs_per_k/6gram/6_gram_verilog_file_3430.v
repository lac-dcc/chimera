// Seed: 3251788676
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wor id_2,
    input wor id_3,
    input wor id_4,
    input wire id_5
);
  assign id_0 = -1 ? id_1 : id_5;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd70
) (
    input  tri1  id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output logic id_3,
    output wor   id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2
  );
  parameter id_7 = (1 == 1);
  logic id_8;
  always @(posedge id_8[id_7]) begin : LABEL_0
    id_3 <= 1;
  end
endmodule
