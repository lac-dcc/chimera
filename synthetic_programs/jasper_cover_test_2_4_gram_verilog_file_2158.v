module module_0 (
    input id_1,
    output [id_1  ==  id_1 : id_1] id_2,
    output logic [1 : id_1] id_3,
    inout id_4
);
  id_5 id_6 ();
  logic id_7;
  specify
    (id_8[1] => id_9) = (1  : id_8  : id_1, {id_7, id_4} : id_8  : id_3);
    (id_10 => id_11[1]) = (id_9  : id_3  : id_11, id_1  : 1  : id_8);
    (id_12[1] => id_13[1]) = (id_2  : id_13  : id_7[1 : id_9], id_9  : id_1  : id_4);
    (id_14 => id_15) = (id_10  : id_6  : id_13, id_2  : id_2  : id_1);
    (id_16 => id_17[1]) = (id_14, id_1);
    if (id_8) (id_18[1] => id_19[1]) = (id_19, id_19);
    (id_20 => id_21) = (1'b0 : id_2[id_12 : id_14] : id_8, id_4);
    (id_22[1] => id_23) = (id_10  : id_13  : id_16, id_1  : id_8 && id_22  : id_23);
    (id_24[1] => id_25) = (1'h0 : 1'h0 : 1'd0, id_24  : id_11  : id_4);
    (id_26 => id_27) = (id_10[id_25] : id_26  : id_2[id_14[{
      id_23
    } : id_25]], id_24  : id_2[id_21] : id_21);
    (id_28[1] => id_29[1]) = (id_12  : 1  : id_20, id_16  : id_25  : id_10);
    (id_30[1] => id_31) = (id_4  : id_26  : id_15, id_22  : id_18  : id_14);
    specparam id_32 = id_14  : id_20  : id_10;
    (id_33[1] => id_34) = (id_19  : id_23  : id_13, 1  : id_11  : id_32);
  endspecify
endmodule
