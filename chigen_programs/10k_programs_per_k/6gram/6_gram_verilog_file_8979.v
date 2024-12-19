// Seed: 2917013094
module module_0;
  wire id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10;
  assign module_1.id_4 = 0;
  initial
  fork : SymbolIdentifier
  join_none : SymbolIdentifier
  assign module_2.SymbolIdentifier.SymbolIdentifier.id_2 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    input wor id_2,
    input supply1 id_3,
    input wor id_4,
    output supply1 id_5
);
  assign id_5 = id_4 ? id_2 : id_4;
  module_0 modCall_1 ();
endmodule
module module_2;
  wire id_1;
  wand id_3;
  assign id_3 = 1'b0 == id_2;
  always @(posedge 1 or posedge 1) begin : LABEL_0
    wait (1);
    id_3 = (id_2);
  end
  module_0 modCall_1 ();
endmodule
