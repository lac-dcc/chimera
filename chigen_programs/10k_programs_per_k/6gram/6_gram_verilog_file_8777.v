// Seed: 4055952075
module module_0;
  assign id_1 = 1 - id_1 ? 1 : 1'd0;
  assign module_1.id_1 = 0;
  always
  fork : SymbolIdentifier
    #1 id_1 = id_1;
    begin : LABEL_0
      disable id_2;
      id_1 <= id_2;
    end
  join : SymbolIdentifier
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
  initial id_2 = #1 id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output logic id_0,
    output logic id_1,
    input  logic id_2,
    input  wand  id_3,
    input  logic id_4
);
  always @(posedge id_4) begin : LABEL_0
    id_1 <= #1 id_4;
    id_0 <= 1 + 1;
    if (1 && 1'd0 == 1'd0) id_0 <= #1 id_2;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
