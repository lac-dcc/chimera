// Seed: 1749795193
module module_0;
  uwire  id_1  ,  id_2  ,  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ;
  assign id_33 = id_19;
  assign id_27 = id_22;
  always @(1 or 1) id_38 = 1;
  id_42(
      .id_0(id_26), .id_1({id_25, 1} == 1), .id_2(id_28)
  );
  uwire id_43 = id_40 & (id_25);
  wire  id_44;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  supply1 id_4;
  supply0 id_5 = id_3 ? id_4 : 1;
  assign id_5 = 1;
  module_0();
  initial begin
    id_4 = $display(1 == id_5);
    id_3 <= #1 "";
    id_4 = 1;
  end
endmodule
