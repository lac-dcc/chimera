// Seed: 307312882
module module_0 (
    input wand id_0,
    input wand id_1,
    output supply0 id_2,
    output supply1 id_3,
    output tri0 id_4,
    input uwire id_5,
    input wand id_6,
    input wand id_7
);
  parameter id_9 = 1;
  wire  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ,  id_55  ,  id_56  ,  id_57  ,  id_58  ,  id_59  ;
  wire id_60;
  ;
  localparam id_61 = id_9;
  rtran (id_50, 1);
  logic \id_62 ;
  wire [1 'b0 : -1] id_63;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd72
) (
    input wand id_0,
    output tri id_1,
    input wire id_2,
    input tri1 id_3,
    input supply1 _id_4,
    output supply1 id_5,
    input tri id_6,
    input tri0 id_7,
    input uwire id_8,
    output wor id_9
);
  localparam id_11 = 1;
  parameter [id_4 : id_4] id_12 = id_11;
  assign id_1 = (id_4) && 1;
  logic id_13 = id_13++;
  wire id_14;
  wire id_15;
  logic id_16;
  wire [-1 'b0 : 1] id_17;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_5,
      id_5,
      id_1,
      id_2,
      id_8,
      id_3
  );
endmodule
