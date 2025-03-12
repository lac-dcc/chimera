// Seed: 1623727019
module module_0 (
    output supply1 id_0,
    output wor id_1,
    input supply1 id_2,
    output wire id_3,
    input wand id_4,
    input wor id_5,
    output logic id_6,
    output tri id_7,
    input tri0 id_8,
    input tri id_9,
    output wand id_10,
    input tri id_11,
    input tri0 id_12
);
  assign id_1 = -1;
  assign id_0 = id_9;
  always @(posedge id_5 or posedge id_11) begin : LABEL_0
    id_6 <= id_4;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    output logic id_2
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
  parameter id_4 = "";
  initial id_2 = id_0;
endmodule
