// Seed: 4275850773
module module_0 (
    output uwire id_0,
    output supply0 id_1,
    input supply0 id_2,
    output tri id_3,
    output wor id_4,
    output wand id_5,
    input supply0 id_6,
    output wor id_7
    , id_13,
    input supply1 id_8,
    input supply0 id_9,
    input tri1 id_10,
    output supply1 id_11
);
  wire id_14;
  initial
  fork : SymbolIdentifier
  join_none : SymbolIdentifier
endmodule
module module_1 (
    input tri0 id_0,
    output tri id_1,
    output wor id_2,
    input tri0 id_3,
    output tri0 id_4,
    output tri0 id_5,
    output wand id_6,
    inout tri id_7,
    output supply1 id_8,
    output uwire id_9,
    output tri0 id_10
);
  parameter id_12 = 1;
  always @(posedge -1 or negedge id_0) begin : LABEL_0
    $clog2(65);
    ;
    #1;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_3,
      id_5,
      id_6,
      id_5,
      id_3,
      id_7,
      id_3,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule
