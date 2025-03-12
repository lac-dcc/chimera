// Seed: 1945595612
module module_0 (
    input wor id_0,
    output supply1 id_1,
    output tri1 id_2,
    inout wor id_3,
    output supply0 id_4,
    input tri id_5,
    input tri0 id_6,
    input tri0 id_7
);
  wire id_9;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    output tri id_2,
    output supply1 id_3,
    input uwire id_4,
    input uwire id_5 id_10,
    output wand id_6,
    input wire id_7,
    output logic id_8
);
  parameter id_11 = 1 & 1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6,
      id_10,
      id_6,
      id_1,
      id_10,
      id_7
  );
  assign modCall_1.id_3 = 0;
  assign id_8 = 1 ? id_4 < -1 & id_7 : id_5;
  always_comb @(posedge !id_11) begin : LABEL_0
    id_8 <= -1;
  end
endmodule
