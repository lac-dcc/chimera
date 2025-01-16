// Seed: 2271868768
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output wire id_3,
    output supply1 id_4,
    output supply1 id_5,
    input supply0 id_6
);
  wire id_8, id_9, id_10;
  module_2 modCall_1 ();
endmodule : SymbolIdentifier
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input supply1 id_2
);
  wire id_4;
  wire id_5, id_6, id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0
  );
  wire id_8;
  wire id_9;
endmodule
module module_2 ();
  initial
    if (id_1) id_2 <= id_1 ? id_1 : -1;
    else $display(1, 1, 1);
  assign module_0.id_6 = 0;
endmodule
