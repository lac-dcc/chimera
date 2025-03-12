// Seed: 2650841506
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input wor id_2,
    input wire id_3,
    input supply1 id_4,
    output wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    output wire id_8
);
  initial
  fork : SymbolIdentifier
  join_none : SymbolIdentifier
  wire [-1 : 1] id_10;
  assign module_1.SymbolIdentifier.SymbolIdentifier.id_5 = 0;
  logic id_11;
  ;
  assign id_5 = id_10;
  localparam id_12 = 1;
  logic [1 : ""] id_13;
endmodule
module module_1 (
    input tri0 id_0,
    output wire id_1,
    input tri0 id_2,
    input supply0 id_3,
    output uwire id_4,
    input wire id_5
);
  reg [1 : 1] id_7 = -1'b0;
  wire id_8;
  and primCall (id_4, id_2, id_5);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_3,
      id_4,
      id_5,
      id_5,
      id_4
  );
  always @(posedge 1 - 1 or posedge id_8) begin : LABEL_0
    id_7 <= -1;
  end
  wire id_9;
endmodule
