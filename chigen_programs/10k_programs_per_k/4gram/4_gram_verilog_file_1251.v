// Seed: 2455119690
module module_0 #(
    parameter id_27 = 32'd65,
    parameter id_29 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_9;
  bit
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      _id_27,
      id_28;
  assign id_2 = id_17;
  wire  _id_29;
  logic id_30;
  ;
  wire [id_29 : id_27] id_31, id_32, id_33, id_34, id_35, id_36, id_37, id_38, id_39;
  always @(posedge (id_27) or posedge id_39)
    if (-1) begin : LABEL_0
      id_19 = 1;
    end
  always @(id_34 or posedge (id_27) !== {-1'b0, id_10}) begin : LABEL_1
    $signed(85);
    ;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_10
  );
  assign modCall_1.id_18 = 0;
  inout reg id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  localparam id_11 = 1;
  always_ff @(1'd0 or negedge 1) if (1) id_4 <= id_2;
endmodule
