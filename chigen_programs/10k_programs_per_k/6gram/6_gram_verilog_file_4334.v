// Seed: 237356620
module module_0 #(
    parameter id_16 = 32'd81
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
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output tri1 id_9;
  inout wire id_8;
  inout tri1 id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  localparam id_16 = 1'b0;
  assign id_10 = id_2 ? id_7 : id_3;
  wire id_17;
  wire id_18;
  assign id_7 = -1;
  parameter id_19 = id_16;
  wire id_20;
  logic [7:0] id_21;
  logic id_22;
  defparam id_16.id_16 = id_16 == -1;
  assign id_21[1] = -1;
  assign id_9 = 1 ? -1'h0 == -1 & id_12 : id_21;
endmodule
module module_1 #(
    parameter id_5 = 32'd38,
    parameter id_9 = 32'd71
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  output wire id_4;
  inout wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  assign id_3 = id_3;
  logic id_6;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_6,
      id_6,
      id_6,
      id_3,
      id_3,
      id_6,
      id_4,
      id_6,
      id_3,
      id_6,
      id_6,
      id_3,
      id_3
  );
  localparam id_7 = 1;
  wire id_8;
  wire _id_9;
  always @* begin : LABEL_0
    disable id_10;
  end
  struct {
    logic [-1 : id_5  <=  1 'h0] id_11;
    id_12 id_13;
  } ["" : -1] id_14;
  ;
  logic [id_9 : -1] id_15;
  ;
  final begin : LABEL_1
    disable id_16;
    id_14 = id_2[""];
  end
endmodule
