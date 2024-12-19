// Seed: 1197646989
module module_0 ();
  assign id_1 = 1'b0;
  tri0 id_2;
  tri  id_3 = 1;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  always
  fork
    id_1 <= id_0;
    if (1) begin : LABEL_0
      id_1 <= 1 !== 1'h0;
    end
  join : SymbolIdentifier
  reg id_3;
  always @(1) id_3 <= 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.SymbolIdentifier.id_1 = 0;
  int id_4;
  assign id_4 = id_3;
  assign {1, ""} = (1);
  specify
    (id_5 => id_6) = ((1'h0), 1);
    (id_7 *> id_8[1]) = (id_6);
    specparam id_9 = id_4;
  endspecify
endmodule
