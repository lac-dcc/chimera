// Seed: 1150048891
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
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_7 = (1);
  assign id_7 = id_3;
  uwire  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  =  id_3  ,  id_21  ,  id_22  =  1  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  =  1  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  =  1 'b0 ,  id_39  ;
  wire id_40;
  wire id_41;
  assign id_22 = 'b0;
  assign id_23 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_2 <= id_1;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_26 = 0;
  reg id_6 = 1;
  if (id_1) id_7(.id_0(id_1 + 1), .id_1(1 - id_4), .id_2(1'b0), .id_3(), .id_4(1'b0), .id_5(id_1));
  else begin : LABEL_0
    assign id_2 = id_6;
  end
endmodule
