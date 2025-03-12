// Seed: 2162535226
module module_0 #(
    parameter id_7 = 32'd88,
    parameter id_8 = 32'd84
) (
    id_1,
    id_2,
    id_3[1 : 1],
    id_4[id_8 : id_7],
    id_5,
    id_6,
    _id_7,
    _id_8
);
  input wire _id_8;
  input wire _id_7;
  inout wire id_6;
  output wire id_5;
  input logic [7:0] id_4;
  input logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  logic id_9;
  ;
  assign id_9 = -1;
  assign id_9 = id_2;
endmodule
module module_1 #(
    parameter id_13 = 32'd15,
    parameter id_16 = 32'd17,
    parameter id_17 = 32'd84,
    parameter id_2  = 32'd53,
    parameter id_22 = 32'd99,
    parameter id_23 = 32'd24,
    parameter id_3  = 32'd54,
    parameter id_32 = 32'd50,
    parameter id_33 = 32'd36,
    parameter id_34 = 32'd10,
    parameter id_9  = 32'd92
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6[-1 :-1],
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11[-1'b0 : 1],
    id_12,
    _id_13,
    id_14,
    id_15,
    _id_16,
    _id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    _id_22,
    _id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28
);
  inout wire id_28;
  output wire id_27;
  input wire id_26;
  inout tri id_25;
  inout wire id_24;
  inout wire _id_23;
  output wire _id_22;
  inout reg id_21;
  output wire id_20;
  inout uwire id_19;
  inout wire id_18;
  inout wire _id_17;
  input wire _id_16;
  output wire id_15;
  output wire id_14;
  output wire _id_13;
  input wire id_12;
  input logic [7:0] id_11;
  input wire id_10;
  input wire _id_9;
  output wire id_8;
  inout wire id_7;
  input logic [7:0] id_6;
  inout wire id_5;
  input wire id_4;
  input wire _id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_19 = 1'b0;
  always id_21 <= id_3 !== 1;
  logic id_29;
  wire id_30, id_31, _id_32, _id_33, _id_34;
  assign id_25 = -1;
  parameter id_35 = -1;
  wire [-1 : -1] id_36["" -  id_16 : ""];
  wire id_37[id_3 : id_22  &&  id_34];
  assign id_34 = id_17.id_34;
  wire [id_23 : 1] id_38;
  always $clog2(id_34);
  ;
  wire [id_34 : 1 'd0] id_39, id_40;
  logic [7:0]["" : 1] id_41;
  wire id_42;
  wire [id_2  *  id_32  |  1 : id_17] id_43;
  logic [1  +  -1 'b0 : id_13] id_44;
  or primCall (
      id_18,
      id_10,
      id_12,
      id_25,
      id_7,
      id_45,
      id_31,
      id_41,
      id_43,
      id_44,
      id_36,
      id_46,
      id_24,
      id_21,
      id_5,
      id_38,
      id_34,
      id_47,
      id_28,
      id_42,
      id_11,
      id_29,
      id_26,
      id_35,
      id_6,
      id_19,
      id_30
  );
  wire [!  -1 : id_33] id_45;
  localparam id_46 = 1;
  wire id_47;
  module_0 modCall_1 (
      id_7,
      id_43,
      id_11,
      id_6,
      id_18,
      id_46,
      id_34,
      id_34
  );
  struct packed {
    struct packed {
      integer id_48;
      id_49   id_50;
      logic   id_51;
    } [id_22 : id_9] id_52;
    logic id_53;
  } id_54;
endmodule
