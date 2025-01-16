// Seed: 2064278111
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  id_3(
      id_2
  );
  assign module_2.id_0 = 0;
endmodule : SymbolIdentifier
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  nor primCall (id_1, id_4, id_2);
  module_0 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_2 (
    output supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri id_3,
    input tri1 id_4,
    output tri0 id_5,
    input uwire id_6,
    output supply0 id_7,
    output supply1 id_8
);
  id_10 :
  assert property (@(posedge 1) -1) if (-1) id_5 = id_3;
  wire id_11;
  nand primCall (id_5, id_4, id_3, id_1, id_10);
  module_0 modCall_1 (
      id_11,
      id_11
  );
endmodule
