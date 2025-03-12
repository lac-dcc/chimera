// Seed: 2923951952
module module_0 (
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
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  tri1 id_15 = -1'd0;
  wire id_16;
endmodule
module module_1 #(
    parameter id_5 = 32'd92
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  input wire _id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout reg id_1;
  reg [id_5  |  -1 : 1] id_6, id_7, id_8;
  logic id_9;
  wire  id_10;
  always
  fork
    assign id_7 = -1;
  join_any
  id_11 :
  assert property (@(-1) id_6)
  else id_1 = 1;
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_8 = 1;
      id_1 = -1'b0;
    end
    id_6 <= 1;
  end
  generate
    wire id_12;
    assign id_7 = id_3;
  endgenerate
  assign id_1 = id_7;
  wire id_13 = id_1;
  parameter id_14 = -1;
  nand primCall (id_1, id_2, id_17, id_6);
  localparam id_15 = 1;
  wire id_16;
  always_comb @(negedge id_7) begin : LABEL_2
    id_6 <= id_8;
    $signed(9);
    ;
  end
  parameter id_17 = id_14;
  assign id_16 = id_17;
  module_0 modCall_1 (
      id_16,
      id_11,
      id_15,
      id_4,
      id_10,
      id_10,
      id_12,
      id_13,
      id_15,
      id_16,
      id_13,
      id_10,
      id_9,
      id_11
  );
  wire id_18;
endmodule
