// Seed: 3169745748
module module_0 (
    input  tri   id_0,
    output tri   id_1,
    output logic id_2,
    output tri1  id_3,
    output tri1  id_4,
    output tri   id_5,
    input  tri0  id_6
);
  always @(posedge id_6 or 1) begin : LABEL_0
    if (1) id_2 <= 1;
  end
endmodule
module module_1 (
    input logic id_0,
    input logic id_1,
    output supply1 id_2,
    output logic id_3,
    output supply0 id_4,
    input wor id_5
);
  assign id_4 = id_5;
  assign id_3 = id_1;
  logic id_7 = id_0;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_7,
      id_2,
      id_2,
      id_2,
      id_5
  );
  assign modCall_1.id_5 = 0;
  initial
  fork : SymbolIdentifier
  join_any : SymbolIdentifier
  uwire id_8 = 1;
  always if (id_5) id_7 <= 1;
endmodule
