// Seed: 1082364015
module module_0 #(
    parameter id_9 = 32'd70
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire [{ "" } : -1] id_8;
  logic _id_9, id_10;
  wire [id_9 : 1 'b0] id_11;
  wire id_12;
  parameter id_13 = 1;
  wire \id_14 ;
  logic id_15 = 1, id_16 = -1, id_17 = id_16 * id_6;
  logic id_18;
  wire  id_19;
endmodule
module module_1 #(
    parameter id_2 = 32'd90,
    parameter id_6 = 32'd89
) (
    id_1,
    _id_2
);
  input wire _id_2;
  output reg id_1;
  wire id_3;
  parameter id_4 = 1;
  localparam id_5 = id_4[-1];
  always_latch @(posedge -1'h0 or -1) begin : LABEL_0
    id_1 = 1;
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3
  );
  logic _id_6;
  ;
  wire id_7;
  wire [id_6 : id_2  <<  1] id_8;
endmodule
