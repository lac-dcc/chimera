// Seed: 2857726346
module module_0 #(
    parameter id_5 = 32'd95
) (
    id_1,
    id_2,
    id_3[-1 : 1],
    id_4
);
  output uwire id_4;
  output logic [7:0] id_3;
  output logic [7:0] id_2;
  output wire id_1;
  assign id_2[-1] = -1;
  logic _id_5;
  localparam id_6 = 1;
  bit   id_7;
  logic id_8 = id_8[id_5];
  logic id_9;
  ;
  wire id_10, id_11;
  logic id_12;
  ;
  wire id_13;
  ;
  assign id_4 = -1;
  always #1
    @(-1'd0) begin : LABEL_0
      id_7 = 1;
    end : SymbolIdentifier
endmodule
module module_1 #(
    parameter id_1 = 32'd22,
    parameter id_2 = 32'd71
) (
    _id_1,
    _id_2[id_2 :-1],
    id_3,
    id_4
);
  output wire id_4;
  output logic [7:0] id_3;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4
  );
  input logic [7:0] _id_2;
  input wire _id_1;
  assign id_3[id_1] = id_2;
  logic id_5;
endmodule
