// Seed: 3669560139
module module_0 (
    input  uwire id_0,
    output tri0  id_1
);
  assign id_1 = id_0 - id_0;
endmodule
module module_1 (
    output wand id_0,
    input uwire id_1,
    output tri1 id_2,
    output logic id_3,
    input supply0 id_4,
    input logic id_5,
    input wire id_6,
    input logic id_7
);
  logic id_9;
  module_0 modCall_1 (
      id_4,
      id_2
  );
  assign modCall_1.type_1 = 0;
  assign id_9 = id_7;
  always @(posedge id_6) begin : LABEL_0
    id_3 <= 1;
    id_3 <= id_5;
    id_9 <= id_9;
  end
  wire id_10, id_11;
  always @(posedge 1 or posedge id_7) release id_0;
endmodule
