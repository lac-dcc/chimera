// Seed: 156982620
module module_0 (
    input wor  id_0,
    input wire id_1
);
  always @(1, posedge 1)
    if (id_0) begin : LABEL_0
      id_3 = id_3;
    end else begin : LABEL_0
      deassign id_4;
    end
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1,
    output tri1  id_2,
    output wire  id_3,
    output tri0  id_4,
    input  uwire id_5,
    output tri   id_6
);
  assign id_2 = id_5;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  assign modCall_1.type_5 = 0;
  assign id_4 = id_5;
  assign id_6 = id_1;
  always
  fork
    id_0 <= 1;
    #1;
  join : SymbolIdentifier
endmodule
