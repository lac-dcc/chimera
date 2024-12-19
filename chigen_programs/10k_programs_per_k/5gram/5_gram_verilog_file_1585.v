// Seed: 970779647
module module_0 (
    input  uwire   id_0,
    output supply1 id_1
);
  wire id_3;
  initial begin : LABEL_0
    id_5 <= id_5;
  end
  wire id_6 = id_3;
endmodule
module module_1 (
    output tri0 id_0,
    input wire id_1,
    output wire id_2,
    input supply0 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    output wor id_0,
    output logic id_1,
    output logic id_2,
    output tri0 id_3,
    input supply1 id_4
);
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_0
  );
  assign modCall_1.id_1 = 0;
  reg id_8;
  always
  fork : SymbolIdentifier
    if (1) begin : LABEL_0
      if (1) begin : LABEL_0
        id_1 <= id_8;
      end
    end else id_2 <= 1;
    @(negedge 1);
  join : SymbolIdentifier
endmodule
