// Seed: 578666575
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    output wor id_2,
    input tri0 id_3,
    input wand id_4,
    output supply0 id_5
);
  wire id_7;
  assign id_1 = 1;
  assign id_2 = 1 ? 1'b0 : id_0 ? id_3 & 1 & id_3 : id_3;
  wire id_8;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  tri   id_1,
    input  uwire id_2,
    output tri1  id_3,
    output logic id_4,
    input  wor   id_5,
    input  tri   id_6,
    output tri1  id_7,
    input  wor   id_8,
    input  tri0  id_9,
    input  tri   id_10,
    input  tri1  id_11,
    input  tri1  id_12,
    output wire  id_13
);
  always @(posedge 1 or posedge id_1) begin : LABEL_0
    id_4 <= 0 + 1;
  end
  module_0 modCall_1 (
      id_8,
      id_13,
      id_13,
      id_9,
      id_5,
      id_13
  );
endmodule
