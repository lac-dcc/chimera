// Seed: 1242252648
module module_0 (
    output wor id_0,
    output supply0 id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4
);
  assign id_1 = -1;
endmodule
module module_1 (
    input tri id_0,
    output logic id_1,
    output uwire id_2,
    input supply1 id_3,
    input uwire id_4
);
  always begin : LABEL_0
    fork
      id_1 <= 1'h0;
    join
  end
  assign id_2 = id_4;
  assign id_2 = -1'd0;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_0,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule : SymbolIdentifier
