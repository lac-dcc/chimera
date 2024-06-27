`timescale 1ps / 1ps
module module_0 #(
    parameter id_1 = {id_1[id_1], id_1}
);
  id_2 id_3 (
      .id_2(id_1[0]),
      .id_2(1'b0)
  );
  id_4 id_5 (
      .id_4(1),
      id_3,
      .id_1(id_4)
  );
  specify
    (id_6[1] => id_7[1]) = (id_5  : 1  : (id_2), id_1);
    (id_8[1] => id_9) = (id_2  : id_4[id_5] : 1'd0, id_3);
    (id_10[1] => id_11) = (id_1, id_9[id_11[id_1]&1'b0] : id_3  : id_6[1]);
    if (id_11) (id_12[1] => id_13) = (id_10 - 1  : 1  : id_8 & id_11, id_10);
    (posedge id_14[1] => (id_15 +: ~id_8)) = (id_5[1] : id_1[id_3|id_3] : 1, 1  : 1  : id_12);
    (id_16[1] => id_17) = (id_11  : 1 & id_1[1'b0] : id_14, id_7[1] : id_13  : 1);
    (id_18[1] => id_19) = (id_3[1] : id_19  : id_5 == 1, 1  : id_16  : id_18[id_17]);
    if  (  id_17  )  (  posedge  id_20  =>  (  id_21  +:  id_1  )  )  =  (  id_19  :  id_19  &  id_6  :  1  ,  id_4  [  id_2  [  id_14  ]  ]  :  id_13  :  id_13  )  ;
    (id_22[1] => id_23[1]) = (id_9  : id_7  : id_20, 1  : id_5  : id_20);
    (id_24[1] => id_25) = (id_20[(1'b0)] == id_25  : 1  : 1, 1  : 1  : id_16);
    (id_26 => id_27[1]) = (1  : 1  : id_21, id_25  : id_19[id_2] : 1);
    (id_28 => id_29) = (1  : id_29  : 1, 1  : id_18  : 1);
    (id_30 => id_31) = (1, id_6 > 1  : id_13  : 1);
    (id_32 => id_33) = 1;
    (id_34 => id_35) = (id_25, id_33[1] : id_25  : id_11);
  endspecify
endmodule
