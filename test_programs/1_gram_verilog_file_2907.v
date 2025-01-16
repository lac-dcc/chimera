// Seed: 1827432103
module module_0 (
    input supply1 id_0,
    output wor id_1,
    output wand id_2,
    input uwire id_3,
    output wand id_4
);
  wand id_6 = 1;
  assign id_1 = {id_0, -1, 1} * id_6;
  assign id_4 = -1'h0;
  wire id_7;
  tri0 id_8 = -1;
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    input tri id_2,
    output tri id_3,
    output supply0 id_4,
    output logic id_5,
    input supply1 id_6,
    output supply0 id_7
);
  always @(posedge id_1 or posedge 1) $display;
  always_ff $display(id_1);
  parameter id_9 = -1'h0;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_0,
      id_3
  );
  assign modCall_1.type_11 = 0;
  assign id_4 = id_2;
  assign id_5 = 1;
  xnor primCall (id_5, id_9, id_6, id_0, id_2, id_1);
  initial if (1'b0) id_5 <= id_6 & id_1;
endmodule
