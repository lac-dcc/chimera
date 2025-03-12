// Seed: 2140246278
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
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  inout supply1 id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input logic [7:0] id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_15 = 1 ? 1 : id_9[1+:1];
  assign id_8  = id_12;
endmodule
program module_1 #(
    parameter id_13 = 32'd92,
    parameter id_6  = 32'd49
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
    id_12
);
  input logic [7:0] id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire _id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_5,
      id_5,
      id_12,
      id_5,
      id_10,
      id_9,
      id_5,
      id_2,
      id_10,
      id_9
  );
  output wire id_1;
  integer [~  id_6 : -1] _id_13;
  ;
  logic id_14;
  ;
  id_15 :
  assert property (@(posedge 1 && 1'b0 ==? id_10 << 1) 1)
  else $signed(45);
  ;
  wire  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ;
  parameter id_54 = "";
  assign id_32 = id_30;
endprogram
