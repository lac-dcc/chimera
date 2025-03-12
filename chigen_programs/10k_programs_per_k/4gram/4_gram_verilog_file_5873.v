// Seed: 3589489213
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input wand id_2,
    input wor id_3,
    output tri1 id_4,
    output wand id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri1 id_8,
    input wire id_9,
    output wor id_10,
    input wor id_11
);
  assign id_5 = -1'b0 - (-1);
  wire id_13;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input wor id_2,
    output logic id_3,
    output supply1 id_4,
    input tri0 id_5
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_4,
      id_4,
      id_5,
      id_5,
      id_2,
      id_5,
      id_4,
      id_1
  );
  assign modCall_1.id_8 = 0;
  always @(posedge id_2 or negedge id_1) begin : LABEL_0
    id_3 = id_0;
    id_3 = -1;
  end
  parameter id_7 = -1 ? 1 : 1'b0;
endmodule
