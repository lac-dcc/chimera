// Seed: 2127209815
module module_0 #(
    parameter id_4 = 32'd68
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  input wire _id_4;
  input wire id_3;
  output reg id_2;
  output wire id_1;
  wire [1 'b0 : id_4] id_6;
  localparam id_7 = 1;
  always_latch #1 id_2 = -1;
endmodule
module module_1 #(
    parameter id_6 = 32'd75,
    parameter id_8 = 32'd64
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  inout wire _id_8;
  output reg id_7;
  input wire _id_6;
  output wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11;
  assign id_8 = id_10;
  assign id_7 = id_3;
  wire [id_8 : id_6] id_12;
  reg id_13;
  assign id_13 = 1 ? 1 : 1 ? id_3[1 :-1] : id_12 ? id_12 | id_13 : 1 ? 1 : id_1;
  genvar id_14;
  logic id_15;
  always @(-1 << 1 or negedge 1'b0) begin : LABEL_0
    if (1) begin : LABEL_1
      id_7 <= #1  (!id_4);
      if (1) id_13 <= -1;
    end
  end
  module_0 modCall_1 (
      id_5,
      id_13,
      id_4,
      id_8,
      id_4
  );
endmodule
