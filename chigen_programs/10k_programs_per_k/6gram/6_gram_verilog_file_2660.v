// Seed: 1047026767
module module_0 (
    output wire id_0
);
  logic [7:0] id_2;
  assign id_2[-1] = id_2[1];
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wire id_0,
    output tri id_1,
    input tri1 id_2,
    output wire id_3,
    output wand id_4,
    input supply0 id_5,
    output logic id_6,
    input wor id_7
);
  parameter id_9 = -1 ? -1 : 1;
  assign id_4 = id_2;
  module_0 modCall_1 (id_3);
  assign id_6 = id_7;
  always @(posedge id_2 - id_7 or posedge !id_7 & id_2) begin : LABEL_0
    id_6 <= 1;
  end
endmodule
