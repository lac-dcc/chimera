// Seed: 2173495887
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_11, id_12;
  logic id_13;
endmodule
module module_1 #(
    parameter id_28 = 32'd20,
    parameter id_32 = 32'd10,
    parameter id_37 = 32'd90
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
    id_27,
    _id_28,
    id_29,
    id_30,
    id_31,
    _id_32,
    id_33,
    id_34,
    id_35,
    id_36
);
  output wire id_36;
  output wire id_35;
  output reg id_34;
  output wire id_33;
  inout wire _id_32;
  inout wire id_31;
  inout wire id_30;
  inout wire id_29;
  module_0 modCall_1 (
      id_15,
      id_2,
      id_27,
      id_22,
      id_15,
      id_31,
      id_31,
      id_22,
      id_25,
      id_18
  );
  inout wire _id_28;
  inout wire id_27;
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  xor primCall (
      id_7,
      id_15,
      id_27,
      id_17,
      id_12,
      id_9,
      id_21,
      id_10,
      id_31,
      id_22,
      id_8,
      id_24,
      id_25,
      id_16,
      id_20,
      id_29,
      id_3,
      id_2,
      id_23,
      id_30
  );
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire id_18;
  inout logic [7:0] id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  localparam id_37 = ~(-1);
  assign id_32 = id_17[id_32];
  wire id_38;
  defparam id_37.id_37 = id_37;
  wire id_39;
  always_ff @(posedge 1) begin : LABEL_0
    id_34 <= {id_23 + -1'h0, id_2};
  end
  wire id_40;
  logic [-1 'h0 : id_28  ==  -1] id_41;
  ;
endmodule
