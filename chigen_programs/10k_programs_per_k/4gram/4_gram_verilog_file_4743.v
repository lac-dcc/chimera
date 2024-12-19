// Seed: 354272692
module module_0 ();
  wire id_2;
  assign module_1.type_20 = 0;
endmodule
module module_0 (
    output logic id_0,
    output supply1 id_1,
    input uwire id_2,
    output tri1 id_3,
    output wor id_4,
    output tri0 id_5,
    input uwire id_6,
    input tri id_7,
    input wor id_8,
    output wor id_9,
    input wand id_10,
    input supply1 id_11,
    output wor id_12,
    input supply1 id_13,
    output tri0 module_1,
    input logic id_15
);
  nor primCall (id_0, id_10, id_11, id_13, id_15, id_2, id_6, id_7, id_8);
  module_0 modCall_1 ();
  always @(posedge id_2 or id_10) begin : LABEL_0
    id_0 <= id_15;
  end
endmodule
