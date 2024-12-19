// Seed: 3777242083
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    output wire id_2,
    input supply0 id_3,
    output supply1 id_4,
    output wire id_5
    , id_8,
    input supply1 id_6
);
endmodule
module module_1 (
    input tri0 id_0,
    output wire id_1,
    input wor id_2,
    output wor id_3,
    output supply0 id_4
);
  always @(posedge id_0 or id_0) begin : LABEL_0
    assert (id_2);
    deassign id_4;
    disable id_6;
    #1;
    #1 id_3 = 'h0;
    id_7(id_7);
    id_7 <= 1;
    id_7 = 1 - 1;
  end
  always
  fork : SymbolIdentifier
    #1;
  join : SymbolIdentifier
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_6,
      id_3,
      id_6
  );
  assign modCall_1.SymbolIdentifier.SymbolIdentifier.id_4 = 0;
endmodule
