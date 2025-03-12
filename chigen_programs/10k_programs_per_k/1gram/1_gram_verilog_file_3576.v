// Seed: 2970200376
module module_0 (
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
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_8;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd56,
    parameter id_13 = 32'd11,
    parameter id_14 = 32'd42,
    parameter id_3  = 32'd29,
    parameter id_6  = 32'd73
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    _id_10[1 : id_13<id_14],
    id_11,
    id_12[id_6 : id_3],
    _id_13,
    _id_14,
    id_15
);
  output logic [7:0] id_15;
  output wire _id_14;
  output wire _id_13;
  output logic [7:0] id_12;
  input wire id_11;
  inout logic [7:0] _id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire _id_6;
  output wire id_5;
  input wire id_4;
  inout wire _id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  if (1) wire id_16;
  else begin : LABEL_0
    wire [1 : 1 'd0] id_17;
    assign id_15[1'b0] = id_17;
    begin : LABEL_1
      always_comb id_1[id_10] = -1;
      assign id_15 = id_10;
    end
    logic [7:0][-1] id_18 = 1, id_19;
    logic id_20;
    logic id_21 = 1;
  end
  logic id_22;
  logic id_23;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_22,
      id_8,
      id_16,
      id_9
  );
  assign id_22 = -1;
endmodule
