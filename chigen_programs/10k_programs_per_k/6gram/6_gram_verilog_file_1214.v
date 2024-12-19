// Seed: 2260482142
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    input uwire id_2,
    output tri id_3,
    input supply1 id_4,
    input wand id_5,
    input wire id_6,
    input supply1 id_7,
    output supply0 id_8
);
  assign id_0 = id_5;
endmodule
module module_1 (
    output wand id_0,
    input logic id_1,
    input supply1 id_2,
    output wire id_3,
    input wire id_4,
    output logic id_5,
    input wand id_6
);
  assign id_3 = 1 == id_6 ? 1 : id_1 ? 1 : 1 - 1;
  xor primCall (id_0, id_6, id_1, id_4);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_0,
      id_6,
      id_2,
      id_6,
      id_4,
      id_0
  );
  assign modCall_1.id_6 = 0;
  wire id_8;
  always @(posedge 1 or 1'b0) begin : LABEL_0
    id_5 <= id_1;
  end
endmodule
