// Seed: 3106999080
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri0 id_2,
    input tri1 id_3,
    input supply0 id_4
);
  tri0 id_6;
  wire id_7;
  wire id_8;
  assign module_1.type_4 = 0;
  assign id_6 = id_4;
  assign id_8 = id_8;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1
);
  reg id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1
  );
  always @(posedge id_3) id_3 <= 1;
endmodule
module module_2 (
    input wire id_0,
    input supply1 id_1,
    input wire id_2,
    output tri1 id_3
);
  always
  fork : SymbolIdentifier
    id_3 = id_0;
    $display(1, 1);
  join_none
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.SymbolIdentifier.type_9 = 0;
endmodule
