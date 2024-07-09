module module_0 #(
    parameter id_1 = id_1
) (
    id_2,
    id_3,
    input id_4,
    id_5,
    id_6,
    id_7,
    output [id_3 : 1] id_8,
    id_9,
    id_10,
    id_11,
    input [id_5[id_9] : id_10] id_12,
    id_13,
    id_14,
    input [id_11 : ~  id_4] id_15,
    id_16,
    id_17
);
  specify
    $setuphold(posedge id_18, posedge id_19 &&& id_8, 1, (id_17), id_20);
    (id_21[1] => id_22) = (id_21  : 1  : ~id_14 & id_15, id_6);
    specparam id_23 = id_6;
    (id_24 => id_25) = 1;
  endspecify
endmodule
