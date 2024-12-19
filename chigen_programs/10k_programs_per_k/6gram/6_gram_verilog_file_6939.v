// Seed: 945733245
module module_0 (
    output wire id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    input wire id_4,
    output wire id_5,
    input tri0 id_6,
    input wor id_7,
    input tri1 id_8,
    output wand id_9
);
  always @(negedge id_4) release id_9;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    output wire id_2,
    input supply0 id_3,
    input logic id_4,
    output supply0 id_5,
    input wor id_6,
    input wire id_7,
    input uwire id_8,
    output logic id_9
);
  always @(posedge id_8 or 1) begin : LABEL_0
    id_9 <= id_4;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_8,
      id_7,
      id_6,
      id_1,
      id_7,
      id_6,
      id_8,
      id_1
  );
endmodule
