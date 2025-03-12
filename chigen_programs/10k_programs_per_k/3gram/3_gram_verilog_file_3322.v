// Seed: 942076874
module module_0 (
    input wire id_0,
    input supply0 id_1
    , id_7,
    input tri1 id_2,
    input supply0 id_3,
    input wire id_4,
    output wor id_5
);
  wire id_8;
  wire id_9;
  parameter time id_10 = -1;
  wire id_11 = id_8;
endmodule
module module_1 #(
    parameter id_5 = 32'd40
) (
    input  uwire id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    output wire  id_4,
    input  wire  _id_5,
    output logic id_6,
    output tri   id_7,
    input  tri1  id_8,
    input  tri1  id_9,
    output logic id_10,
    output wor   id_11
);
  wire [1 : id_5] id_13;
  always @(negedge -1'b0) id_10 <= -1;
  or primCall (id_4, id_3, id_13, id_9, id_8, id_2, id_1, id_0);
  module_0 modCall_1 (
      id_8,
      id_3,
      id_8,
      id_8,
      id_1,
      id_4
  );
  assign modCall_1.id_0 = 0;
  always begin : LABEL_0
    id_6 <= id_13;
    if (1'd0) assert (-1'h0);
  end
endmodule
