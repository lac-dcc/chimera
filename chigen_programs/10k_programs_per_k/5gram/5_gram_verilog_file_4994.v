// Seed: 1151233225
module module_0;
  assign id_1 = 1'b0;
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    output logic id_2,
    input wand id_3,
    output tri0 id_4,
    output wand id_5,
    output tri0 id_6,
    input wand id_7,
    input wor id_8,
    output tri0 id_9,
    output supply0 id_10,
    input tri id_11,
    input tri0 id_12,
    input logic id_13,
    output supply0 id_14
);
  generate
    if (id_3) begin : LABEL_0
      always @(posedge (id_7 == id_13) or negedge id_8) id_2 <= (id_13);
    end
  endgenerate
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
