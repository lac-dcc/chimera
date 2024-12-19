// Seed: 3993963837
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  tri0 id_8 = 1'b0;
  wire id_9;
  specify
    if (1 && id_1) (negedge id_10 *> (id_11 +: 1'b0 >> "")) = (1  : id_5  : id_1, id_2);
    (id_12 => id_13) = (id_10  : 1  : id_12, 1);
  endspecify
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    input  tri1  id_2
    , id_7,
    input  tri1  id_3
    , id_8,
    input  tri   id_4,
    output tri0  id_5
);
  always @(posedge id_7) begin : LABEL_0
    id_5 = id_2;
  end
  wire id_9;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9
  );
  assign modCall_1.id_5 = 0;
endmodule
