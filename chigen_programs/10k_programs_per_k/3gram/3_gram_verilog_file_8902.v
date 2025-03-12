// Seed: 2952646159
module module_0 #(
    parameter id_17 = 32'd55
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  localparam id_13 = {
    1, 1
  }, id_14 = id_8, id_15 = id_10, id_16 = id_7, id_17 = id_14, id_18 = -1, id_19 = id_7, id_20 = {
    -1, id_5 - 1
  }, id_21 = id_20, id_22 = id_16 - 1;
  assign id_9 = id_2;
  assign id_1 = id_21;
  wire id_23;
  assign module_1.id_6 = 0;
  wire [id_17 : 1] id_24;
  localparam id_25 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  localparam id_3 = 1;
  logic id_4;
  ;
  supply0 id_5, id_6, id_7, id_8, id_9;
  parameter id_10 = -1'b0;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_10,
      id_10,
      id_10,
      id_10,
      id_3
  );
  logic [7:0] id_11;
  assign id_11[1] = -1;
  assign id_8 = -1;
  always
  fork
    @(negedge -1 - -1, 1 or id_9 or id_11, negedge -1, negedge id_7 or posedge id_7) begin : LABEL_0
      $signed(80);
      ;
    end
  join : SymbolIdentifier
endmodule
