// Seed: 1165898567
module module_0 (
    output wor id_0,
    input wire id_1,
    input supply0 id_2,
    input supply1 id_3
    , id_6,
    input wand id_4
);
  always_comb @(id_1) begin : LABEL_0
    id_6 <= 1 == id_2 + id_6;
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd0
) (
    input  tri   _id_0,
    output wand  id_1,
    input  tri0  id_2,
    output tri   id_3,
    output wor   id_4,
    output logic id_5,
    output wor   id_6
);
  parameter id_8 = 1;
  reg [1 : id_0] id_9;
  logic id_10;
  ;
  always @(id_9) begin : LABEL_0
    id_10 <= id_8 ? 1 : -1'b0;
  end
  assign id_4 = id_10;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_2
  );
  final begin : LABEL_1
    @(posedge id_9);
    id_5 <= -1;
    id_9 = -1;
  end
  parameter id_11 = 1 == |id_8;
  assign id_10 = 1;
endmodule
