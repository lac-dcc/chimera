// Seed: 4003549121
module module_0 (
    output tri1  id_0,
    input  wire  id_1,
    input  tri   id_2,
    input  tri0  id_3,
    input  tri1  id_4,
    output wor   id_5,
    input  tri   id_6,
    input  wor   id_7,
    output logic id_8,
    output wor   id_9
);
  wire id_11;
  always_comb @(negedge id_7)
    if (1) begin : LABEL_0
      id_8 <= -1;
    end else begin : LABEL_1
      id_8 += id_2 != ~id_1;
    end
endmodule
module module_1 (
    output supply0 id_0,
    output tri1 id_1,
    input wire id_2,
    input tri0 id_3,
    output supply0 id_4,
    output logic id_5
);
  always #1 id_5 <= id_2;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_3,
      id_3,
      id_5,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
