// Seed: 2930033877
module module_0 (
    input wor  id_0,
    input tri0 id_1
    , id_3
);
  tri0 id_4 = 1;
  assign module_1.id_6 = 0;
  wire id_5 = 1'b0;
  logic id_6, id_7;
  logic id_8;
  always @(id_4 or id_1) begin : LABEL_0
    deassign id_8;
  end
endmodule
module module_1 (
    output uwire id_0,
    output wor   id_1,
    input  wor   id_2,
    output wire  id_3,
    input  tri   id_4,
    output tri   id_5,
    input  wand  id_6,
    output tri   id_7
);
  wire id_9;
  wire id_10 = id_4;
  module_0 modCall_1 (
      id_6,
      id_2
  );
  assign id_0 = id_6 == -1;
endmodule
