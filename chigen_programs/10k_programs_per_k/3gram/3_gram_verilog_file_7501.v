// Seed: 516831177
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input wor   id_2
);
  wire id_4;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wor   id_1,
    input  tri0  id_2,
    input  uwire id_3,
    inout  logic id_4,
    input  tri1  id_5,
    input  uwire id_6,
    output tri   id_7,
    output wand  id_8,
    output wire  id_9,
    output logic id_10,
    input  logic id_11,
    output uwire id_12,
    output uwire id_13
);
  always_latch @(posedge 1) id_4 <= 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6
  );
  assign id_0 = 1;
  wand id_15 = 1;
  always @(id_6)
    @(negedge 1) begin : LABEL_0
      id_10 <= id_11;
      id_15 = 1 - id_2;
    end
endmodule
