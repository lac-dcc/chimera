// Seed: 3259682346
module module_0;
  wor  id_1  ,  id_2  ,  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ;
  wire id_24;
  always  @  (  id_16  or  id_4  ,  id_22  ,  1  or  1 'd0 !=  id_18  or  id_21  ,  negedge  1  or  negedge  id_12  or  negedge  1  ==  id_15  )  begin :LABEL_0
    id_8  = 1;
    id_22 = id_16;
  end
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri id_4,
    input tri1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output wor id_8,
    input tri1 id_9,
    output supply1 id_10
);
  assign id_10 = 1;
  id_12 :
  assert property (@(posedge 1'b0) 1'b0 || id_4)
  else $display(id_9, id_8++);
  assign id_12 = id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_7 = 0;
endmodule
