// Seed: 1538092487
module module_0 (
    output wire  id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  tri   id_3,
    input  tri   id_4
);
  reg   id_6 = id_4;
  logic id_7;
  assign module_1.id_2 = 0;
  always @(posedge -1'd0) begin : LABEL_0
    id_6 <= #1 id_7 == 1;
  end
endmodule
module module_1 (
    input wand id_0,
    output wor id_1,
    input supply1 id_2,
    output wor id_3,
    output supply1 id_4
);
  assign id_4 = id_2 - id_0 && 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_0,
      id_0
  );
endmodule
