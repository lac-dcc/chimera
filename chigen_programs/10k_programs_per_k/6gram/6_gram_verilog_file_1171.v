// Seed: 1210223630
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output tri0 id_2
);
  always @(posedge 1) begin : LABEL_0
    id_2 = (id_0);
  end
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri0  id_1,
    input  wire  id_2,
    input  tri0  id_3,
    input  tri1  id_4,
    output logic id_5,
    input  wor   id_6,
    output tri0  id_7,
    input  wor   id_8,
    input  wire  id_9,
    input  logic id_10,
    input  tri1  id_11
);
  always @(1'b0 or posedge 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_5 <= id_10;
    end
  end
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7
  );
endmodule
