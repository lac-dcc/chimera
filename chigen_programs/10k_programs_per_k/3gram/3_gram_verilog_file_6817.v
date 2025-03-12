// Seed: 3100585759
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1'd0;
endmodule
module module_1 #(
    parameter id_26 = 32'd19,
    parameter id_6  = 32'd10
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
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
    _id_26,
    id_27
);
  inout wire id_27;
  input wire _id_26;
  inout wire id_25;
  input wire id_24;
  inout wire id_23;
  input wire id_22;
  inout wire id_21;
  inout tri0 id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  inout uwire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output logic [7:0] id_12;
  output wire id_11;
  inout wire id_10;
  output tri0 id_9;
  inout wire id_8;
  module_0 modCall_1 (
      id_21,
      id_10,
      id_27,
      id_2
  );
  input wire id_7;
  input wire _id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output reg id_1;
  assign id_16 = id_14;
  assign id_12[id_26==1 : id_6] = 1;
  assign id_4 = id_6;
  always @(-1 or posedge id_17) begin : LABEL_0
    id_1 <= -1;
  end
  uwire id_28 = -1 - 1;
  assign id_9 = id_13 - (id_5);
  logic id_29;
  ;
  assign id_16 = 1;
  assign id_23 = id_18;
  assign id_20 = 1;
  or primCall (
      id_2,
      id_8,
      id_16,
      id_13,
      id_22,
      id_5,
      id_27,
      id_18,
      id_14,
      id_17,
      id_19,
      id_20,
      id_25,
      id_24,
      id_21,
      id_7,
      id_15,
      id_23,
      id_10
  );
endmodule
