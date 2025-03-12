// Seed: 873270094
macromodule module_0 #(
    parameter id_19 = 32'd59
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output supply0 id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire  id_8;
  logic id_9;
  ;
  assign id_7 = -1;
  wire  id_10;
  logic id_11;
  ;
  wire  id_12;
  logic id_13;
  wire  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  _id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  [  id_19  &&  1  : "" ]  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ,  id_55  ,  id_56  ,  id_57  ,  id_58  ,  id_59  ,  id_60  ,  id_61  ;
  assign id_11 = -1'b0 - id_25;
endmodule
module module_1 #(
    parameter id_16 = 32'd50,
    parameter id_21 = 32'd93
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
    _id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire _id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  module_0 modCall_1 (
      id_15,
      id_12,
      id_19,
      id_19,
      id_2,
      id_3,
      id_6
  );
  input wire id_8;
  inout reg id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_20;
  ;
  wire _id_21;
  always @(posedge 1) begin : LABEL_0
    id_7 <= -1;
    id_7 <= 1;
  end
  logic [1  &  -1 : $realtime] id_22;
  ;
  wire id_23;
  ;
  wire [id_21 : 1] id_24;
  wire [-1 : id_16] id_25;
  logic id_26[1 'b0 : 1];
  ;
endmodule
