// Seed: 3045925188
module module_0 (
    output wand  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  tri0  id_3,
    input  wand  id_4
);
  logic id_6;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    input uwire id_2,
    input uwire id_3,
    output logic id_4,
    output tri id_5,
    output tri1 id_6,
    input tri0 id_7,
    output tri0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    output supply1 id_11,
    input tri0 id_12
);
  always_latch @(negedge id_0) begin : LABEL_0
    id_4#(.id_3(-1'b0)) = -1 < id_2;
  end
  module_0 modCall_1 (
      id_11,
      id_7,
      id_3,
      id_3,
      id_2
  );
  logic id_14;
  assign id_6 = 1 - id_9;
endmodule
