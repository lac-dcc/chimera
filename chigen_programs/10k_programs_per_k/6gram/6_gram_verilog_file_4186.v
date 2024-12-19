// Seed: 4276764617
module module_0 (
    output tri0 id_0,
    input tri id_1,
    output tri1 id_2,
    input supply0 id_3,
    output wand id_4,
    output uwire id_5,
    output tri1 id_6
);
endmodule
module module_1 (
    output tri   id_0,
    output logic id_1,
    input  wor   id_2,
    output logic id_3,
    output tri0  id_4,
    input  uwire id_5,
    input  logic id_6,
    output wor   id_7
);
  always @(posedge id_6) begin : LABEL_0
    if (id_2) id_1 <= 1;
    id_3 <= id_6;
  end
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4,
      id_5,
      id_0,
      id_4,
      id_7
  );
  assign modCall_1.type_1 = 0;
endmodule
