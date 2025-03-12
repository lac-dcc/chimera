// Seed: 3083831056
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output tri0 id_2,
    input wire id_3,
    input wor id_4,
    output supply1 id_5,
    input wor id_6,
    input tri1 id_7,
    input tri0 id_8
);
  logic id_10 = -1;
  module_2 modCall_1 (
      id_6,
      id_0
  );
endmodule
module module_1 (
    input  tri  id_0,
    input  tri1 id_1,
    output wire id_2,
    input  tri0 id_3,
    input  tri  id_4
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_0,
      id_4,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input uwire id_0,
    input wor   id_1
);
  wire [1 : -1] id_3;
  bit id_4;
  always
    if (1) begin : LABEL_0
      fork : SymbolIdentifier
      join
    end else id_4 = -1;
  tri id_5;
  assign id_5 = 1;
  wire id_6;
  localparam id_7 = -1;
  tri id_8 = 1;
  assign module_0.LABEL_0.id_6 = 0;
endmodule
