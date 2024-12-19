// Seed: 3429622742
program module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  wire id_10 = id_5;
endprogram
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_6,
      id_2
  );
  wand  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ;
  assign id_9 = 1;
  specify
    (negedge id_48 => (id_49 +: id_12 << id_32)) = (id_21 == 1, 1  : 1  : (id_1) ^ 1);
    (id_50 => id_51) = (id_3 < 1, id_17);
    if (1 && 1 == 1'b0) (negedge id_52 => (id_53 +: id_30)) = (id_18, id_46);
  endspecify
endmodule
