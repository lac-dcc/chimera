// Seed: 32119760
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri1 id_4
);
  generate
    begin : LABEL_0
      assign id_6 = id_2 == 1;
    end
  endgenerate
  assign module_1.id_15 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wor id_3,
    output tri1 id_4,
    input supply1 id_5,
    output wand id_6,
    input supply1 id_7,
    output tri0 id_8
);
  tri  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_7,
      id_5,
      id_7
  );
  initial begin : LABEL_0
    id_33.id_34(1);
    #1;
    if (1'b0) id_31 = 1;
    else begin : LABEL_0
      disable id_35;
    end
  end
endmodule
