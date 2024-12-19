// Seed: 1990385775
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_4;
  always @(posedge 1 or 1'b0 - 1'b0) begin : LABEL_0
    id_4[1 : 1] = id_1;
    assign id_2 = 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6
  );
  initial
  fork : SymbolIdentifier
  join_any
  or primCall (id_6, id_5, id_7, id_4, id_3, id_8);
endmodule
