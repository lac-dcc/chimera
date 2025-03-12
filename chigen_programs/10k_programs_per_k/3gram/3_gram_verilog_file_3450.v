// Seed: 1538107819
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
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  localparam id_15 = 1;
  wire id_16;
  ;
  wire id_17;
endmodule
module module_1 #(
    parameter id_1  = 32'd65,
    parameter id_10 = 32'd22,
    parameter id_12 = 32'd86,
    parameter id_13 = 32'd37,
    parameter id_2  = 32'd74,
    parameter id_20 = 32'd77,
    parameter id_24 = 32'd61,
    parameter id_9  = 32'd71
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    _id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    _id_20,
    id_21,
    id_22,
    id_23,
    _id_24,
    id_25
);
  inout wire id_25;
  inout wire _id_24;
  input wire id_23;
  inout logic [7:0] id_22;
  output wire id_21;
  inout wire _id_20;
  input wire id_19;
  output wire id_18;
  output reg id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire _id_13;
  module_0 modCall_1 (
      id_5,
      id_16,
      id_25,
      id_16,
      id_16,
      id_3,
      id_7,
      id_14,
      id_23,
      id_16,
      id_3,
      id_19,
      id_25,
      id_5
  );
  input wire _id_12;
  output wire id_11;
  input wire _id_10;
  input wire _id_9;
  output logic [7:0] id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire _id_2;
  input wire _id_1;
  wire id_26;
  ;
  assign id_11 = id_2 | id_24;
  wire id_27 = 1;
  always @(*) id_17 = -1;
  wire [id_10 : (  id_9  #  (
      .  id_24(  1  ),
      .  id_13(  1  )
)  +  ~  id_20  ?  -1 : 1  ?  id_1 : id_12  )] id_28 = id_22[1'b0 : 1];
  assign id_8[!"" : id_2] = -1;
endmodule
