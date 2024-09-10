// Seed: 1140082840
module module_0 #(
    parameter id_2 = 32'd37,
    parameter id_3 = 32'd98
) (
    id_1,
    _id_2,
    _id_3,
    id_4
);
  output id_4;
  output _id_3;
  output _id_2;
  input id_1;
  type_6(
      (1), id_1, 1'b0
  );
  assign  id_1  =  id_1  [  1  ]  ?  1  : "" ?  id_3  [  id_2  ]  :  id_2  [  1  ]  ?  1  :  {  id_2  {  id_3  }  }  ?  id_1  :  id_3  ?  (  id_4  &  {  1  ,  1  }  &  1 'b0 )  :  1  ?  1  :  id_1  [  id_2  ==  id_3  ]  ? 'b0 :  id_3  ?  1  :  1  ?  1 'd0 :  1  ?  id_3  :  1  ;
  logic id_5;
  assign id_1 = id_1;
endmodule
