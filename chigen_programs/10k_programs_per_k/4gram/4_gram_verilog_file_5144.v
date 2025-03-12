// Seed: 2171670011
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    input supply0 id_5,
    output tri0 id_6,
    output uwire id_7,
    output wand id_8
);
  parameter integer id_10 = (1) && 1;
  wire id_11;
endmodule
module module_1 (
    input  wor   id_0,
    output logic id_1,
    output logic id_2,
    input  tri0  id_3,
    output uwire id_4,
    input  uwire id_5,
    input  wire  id_6,
    output tri1  id_7,
    output uwire id_8,
    input  uwire id_9,
    output tri   id_10,
    output wand  id_11
);
  always @(posedge id_5) begin : LABEL_0
    id_1 <= -1 << 1'b0 && -1'b0 - -1;
    id_2 = -1'd0;
    $signed(52);
    ;
  end
  module_0 modCall_1 (
      id_10,
      id_0,
      id_9,
      id_5,
      id_6,
      id_5,
      id_4,
      id_7,
      id_11
  );
  assign modCall_1.id_7 = 0;
endmodule
