// Seed: 3837147213
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  initial $unsigned(80);
  ;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_10 = 32'd10
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
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire _id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_8,
      id_5,
      id_13,
      id_14
  );
  output wire id_1;
  bit id_15;
  assign id_3[id_10] = id_15;
  generate
    if (-1) begin : LABEL_0
      assign id_12 = id_7;
      logic id_16 = -1;
    end
  endgenerate
  parameter id_17 = -1'h0;
  always @* begin : LABEL_1
    id_15 = id_6;
  end
endmodule
