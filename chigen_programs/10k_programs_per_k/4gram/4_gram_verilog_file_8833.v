// Seed: 3705057466
module module_0 #(
    parameter id_5 = 32'd27,
    parameter id_8 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic _id_5;
  ;
  wire [id_5 : -1] id_6;
  wire id_7;
  wire _id_8;
  wire id_9;
  localparam id_10 = 1;
  parameter [id_5 : id_8] id_11 = 1;
  wire id_12;
endmodule
module module_0 #(
    parameter id_16 = 32'd16,
    parameter id_30 = 32'd3
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
    id_15,
    _id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    module_1,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    _id_30
);
  input wire _id_30;
  output reg id_29;
  output tri id_28;
  output reg id_27;
  input wire id_26;
  inout logic [7:0] id_25;
  module_0 modCall_1 (
      id_23,
      id_12,
      id_6,
      id_11
  );
  inout wire id_24;
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire _id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_31;
  assign id_28 = (1) & id_11.id_26 - 1;
  wire id_32;
  initial begin : LABEL_0
    id_27 <= id_24;
    fork
      force id_25 = id_20;
    join
  end
  wire id_33;
  wire [1 'b0 ==  -1 : id_30] id_34;
  always @(1) begin : LABEL_1
    id_25[id_16] <= -1;
  end
  always @(posedge -1) id_29 = !id_16;
endmodule
