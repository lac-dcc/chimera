// Seed: 862605091
module module_0 (
    input tri0  id_0,
    input wand  id_1,
    input uwire id_2
);
  tri0 id_4 = 1;
  wire id_5, id_6;
  assign module_1.type_18 = 0;
endmodule : SymbolIdentifier
module module_1 (
    output uwire id_0,
    input logic id_1,
    output supply1 id_2,
    input wor id_3,
    input tri1 id_4,
    input tri1 id_5,
    input uwire id_6,
    output tri1 id_7,
    output logic id_8,
    input tri id_9,
    input wor id_10
    , id_13,
    input tri1 id_11
);
  initial if (id_4(id_1)) #1 id_8 <= 1;
  initial id_8 <= 1;
  assign id_8 = id_1;
  wire id_14;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_6
  );
  wire id_15;
  nor primCall (id_0, id_1, id_11, id_4, id_14, id_3, id_10, id_9);
endmodule : SymbolIdentifier
