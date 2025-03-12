// Seed: 3305477701
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  wire id_8 = id_3;
  wire [1 'b0 : -1] id_9;
  logic id_10;
endmodule
module module_1 #(
    parameter id_15 = 32'd84,
    parameter id_4  = 32'd37
) (
    id_1,
    id_2,
    id_3,
    _id_4,
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
    _id_15,
    id_16
);
  output tri0 id_16;
  output wire _id_15;
  output wire id_14;
  output tri1 id_13;
  output tri0 id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output reg id_7;
  output wire id_6;
  output wire id_5;
  input wire _id_4;
  inout supply1 id_3;
  output wire id_2;
  inout wire id_1;
  assign id_16 = 1'b0;
  always @(negedge !id_10) begin : LABEL_0
    id_7 <= -1;
  end
  logic [1 : 1] id_17;
  logic [{  1  } : id_15  !==  id_4] id_18;
  ;
  assign id_12 = 1;
  always @("", negedge id_9) id_7 = @(-1'd0 && -1) id_17;
  assign id_13 = 1;
  assign id_3  = -1;
  wire  id_19;
  logic id_20;
  module_0 modCall_1 (
      id_3,
      id_18,
      id_19,
      id_3,
      id_8
  );
  logic id_21;
  assign id_21 = id_4;
  assign id_18 = id_1;
endmodule
