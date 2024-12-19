// Seed: 728133700
module module_0 (
    input tri0 id_0,
    output wand id_1
    , id_22,
    input logic id_2,
    input wire id_3,
    output supply0 id_4,
    input uwire id_5,
    input uwire id_6,
    input wire id_7,
    input wand id_8,
    output tri0 id_9,
    input tri0 id_10,
    output supply1 id_11,
    output tri0 id_12
    , id_23,
    input tri0 id_13,
    output tri1 id_14,
    input tri0 id_15,
    output uwire id_16,
    input wand id_17,
    output tri0 id_18,
    output wor id_19,
    output logic id_20
);
  always @(negedge id_15) begin : LABEL_0
    id_20 <= id_2;
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output wire  id_0,
    input  wor   id_1,
    input  wand  id_2,
    input  tri0  id_3,
    output wand  id_4,
    input  logic id_5,
    input  logic id_6
);
  logic id_8 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_3,
      id_0,
      id_3,
      id_0,
      id_0,
      id_3,
      id_4,
      id_2,
      id_0,
      id_3,
      id_4,
      id_0,
      id_8
  );
  id_9 :
  assert property (@(negedge id_8) id_5)
  else begin : LABEL_0
    id_8 <= id_6;
  end
  always #1;
endmodule
