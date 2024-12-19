// Seed: 3652431406
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output tri id_2,
    input wand id_3,
    output wire id_4
);
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    output logic id_0,
    input wire id_1,
    output logic id_2,
    output wand id_3,
    output tri id_4,
    input uwire id_5,
    input uwire id_6,
    input logic id_7,
    input wor id_8,
    input supply0 id_9,
    input supply1 id_10,
    input wand id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_2 = 0;
  always @(posedge 1) begin : LABEL_0
    id_0 <= id_7;
  end
  assign id_2 = id_7;
endmodule
