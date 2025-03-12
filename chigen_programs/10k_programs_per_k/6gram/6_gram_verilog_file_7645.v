// Seed: 3608605053
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
    .id_23(id_12),
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire [1 : 1] id_24;
  wire id_25;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd63
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_5;
  struct packed {
    logic [1 'd0 : 1 'b0] id_6;
    logic [id_4 : 1] id_7;
  } id_8;
  wire [id_4 : -1 'b0 ==  1] id_9;
  wire [-1 : 1 'h0] id_10;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_10,
      id_9,
      id_6,
      id_3,
      id_7,
      id_10,
      id_3,
      id_1,
      id_9,
      id_1,
      id_6,
      id_10,
      id_3,
      id_1,
      id_8,
      id_5,
      id_9,
      id_6,
      id_2,
      id_5
  );
  wire id_11;
  ;
  logic id_12;
  assign id_8.id_6 = 1'b0;
  always @(posedge id_8 or posedge -1) begin : LABEL_0
    assume (id_3);
  end
endmodule
