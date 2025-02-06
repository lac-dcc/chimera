// Seed: 855129638
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  specify
    (id_7 + => id_8) = (id_7  : 1'b0 == id_1  : 1'b0, id_1  : id_3  : -1);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wor id_12;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_9,
      id_8,
      id_6
  );
  assign modCall_1.id_3 = 0;
  wand id_13;
  wor  id_14;
  id_15(
      $realtime, id_11
  ); specify
    if (id_10) (negedge id_16 => (id_17  : -1'h0)) = (id_12  : id_14  : 1,
                                                      id_13  : $realtime : !id_2);
    (id_18 => id_19) = (id_2  : id_5[$realtime] : 1, id_2  : $realtime : id_3);
    (  posedge  id_20  =>  (  id_21  : $realtime )  )  =  (  1  :  -1 'b0 && $realtime &&  -1 'b0 :  id_4  , $realtime :  -1  :  1  )  ;
  endspecify
endmodule
