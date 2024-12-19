// Seed: 4227287050
module module_0 (
    input wor   id_0,
    input uwire id_1
);
  wire id_3;
  wire id_4;
  assign module_1.id_1 = 0;
  assign id_4 = id_3;
endmodule
module module_1 (
    input  logic id_0,
    input  wand  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output wand  id_4,
    output logic id_5,
    output uwire id_6,
    output tri0  id_7,
    output wand  id_8,
    input  wire  id_9,
    output uwire id_10,
    input  logic id_11,
    output wand  id_12
);
  always_comb @(negedge id_9) begin : LABEL_0
    id_5 <= id_0;
  end
  wire id_14;
  generate
    tri1 id_15 = 1 - ~id_1;
    assign id_5 = id_11;
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
