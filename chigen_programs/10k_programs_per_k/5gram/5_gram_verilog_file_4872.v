// Seed: 389001466
module module_0 (
    output wor id_0,
    input tri0 id_1,
    output supply0 id_2,
    output supply0 id_3,
    input wand id_4,
    output wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    output wor id_8,
    output tri id_9
);
  wire  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri id_1,
    output supply1 id_2
);
  assign id_2 = id_1;
  xnor primCall (id_0, id_4, id_1);
  logic [1 : -1  == 'b0 -  1 'd0] id_4;
  ;
  always_comb @* begin : LABEL_0
    id_0 <= -1 ==? -1;
    @(posedge id_4);
    $unsigned(87);
    ;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
endmodule
