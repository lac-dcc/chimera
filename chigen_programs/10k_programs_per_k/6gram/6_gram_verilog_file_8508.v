// Seed: 1974592985
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input tri1 id_2,
    input tri id_3,
    output logic id_4,
    input supply0 id_5,
    output wire id_6
);
  assign id_4 = -1;
  assign module_1.id_0 = 0;
  always @(posedge (id_3) or id_3) begin : LABEL_0
    id_4 = #(-1) id_3 ^ 1;
  end
  parameter id_8 = 1 & 1;
  wire id_9;
  initial {-1, 1} = (id_5);
endmodule
module module_1 (
    output wor   id_0,
    input  wor   id_1,
    input  wor   id_2,
    output logic id_3
);
  always @(posedge id_2) id_3 <= id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_3,
      id_1,
      id_0
  );
endmodule
