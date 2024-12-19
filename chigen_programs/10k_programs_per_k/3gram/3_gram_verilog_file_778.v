// Seed: 2254019936
module module_0 (
    input supply1 id_0,
    output wire id_1,
    input supply1 id_2,
    output supply0 id_3,
    output supply1 id_4,
    input wire id_5,
    input tri id_6
);
  if (id_0 - id_0) begin : LABEL_0
    always disable id_8;
  end else begin : LABEL_0
    wand id_9 = 1;
  end
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input logic id_2,
    output wand id_3,
    output tri id_4,
    output uwire id_5,
    input supply1 id_6,
    output logic id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_3,
      id_5,
      id_6,
      id_6
  );
  assign id_5 = 0;
  always_comb @(id_2) begin : LABEL_0
    id_7 <= (1 ? id_2 : 1'b0 ? 1'b0 - 1'b0 : 1'b0);
  end
endmodule
