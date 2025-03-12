// Seed: 2923159363
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  wire id_3;
endmodule
module module_2 #(
    parameter id_0 = 32'd65,
    parameter id_3 = 32'd8
) (
    input  tri   _id_0,
    output logic id_1,
    output wor   id_2,
    input  tri0  _id_3
);
  logic [(  id_0  ) : id_0] id_5[id_3 : 1];
  localparam id_6 = 1;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  wire id_7;
  always @* id_1 <= 1'b0;
endmodule : SymbolIdentifier
