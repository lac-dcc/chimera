// Seed: 3447089736
module module_0;
  assign id_1 = $display(id_1 - 1);
endmodule
module module_1 (
    output wor id_0,
    input wor id_1,
    input wand id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri1 id_5,
    input wor id_6,
    output tri0 id_7,
    input supply1 id_8,
    input wor id_9
);
  supply1 id_11 = id_2;
  nand primCall (id_0, id_1, id_11, id_2, id_3, id_4, id_5, id_6, id_8, id_9);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input uwire id_0,
    input logic id_1,
    input tri id_2,
    input tri1 id_3,
    input wand id_4,
    output supply1 id_5,
    output logic id_6
);
  always_comb @(posedge 1) begin : LABEL_0
    id_6 <= id_4 ? 1 : id_1;
  end
  assign id_5 = 1'b0;
  assign id_6 = 1'b0;
  assign id_6 = 1;
  wire id_8, id_9;
  wire id_10;
  wire id_11;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
