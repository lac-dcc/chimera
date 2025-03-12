// Seed: 2738853335
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge id_6) begin : LABEL_0
    wait ((-1));
  end
endmodule
module module_1 #(
    parameter id_1  = 32'd97,
    parameter id_15 = 32'd49,
    parameter id_18 = 32'd90,
    parameter id_20 = 32'd3,
    parameter id_23 = 32'd33,
    parameter id_3  = 32'd63,
    parameter id_6  = 32'd97
) (
    _id_1,
    id_2,
    _id_3,
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
    _id_15,
    id_16,
    id_17,
    _id_18,
    id_19,
    _id_20
);
  input wire _id_20;
  inout wire id_19;
  input wire _id_18;
  inout wire id_17;
  output wire id_16;
  output wire _id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_19,
      id_12,
      id_4,
      id_19,
      id_4,
      id_13
  );
  input wire _id_6;
  input wire id_5;
  inout wire id_4;
  input wire _id_3;
  inout wire id_2;
  input wire _id_1;
  always disable id_21;
  logic [id_18 : 1] id_22;
  ;
  integer [id_3 : id_15] _id_23;
  ;
  wire id_24;
  wire [id_23 : id_23  -  id_6] id_25;
  bit [(  id_6  ) : id_20] id_26;
  always @(posedge id_19 or id_11 & 1) begin : LABEL_0
    if ((-1) - 1) begin : LABEL_1
      id_26 = id_7;
    end else id_22 <= (1);
  end
  wire id_27;
  wire [id_18 : id_1] id_28;
  wire id_29;
  ;
endmodule
