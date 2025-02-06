// Seed: 2612575583
module module_0 (
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
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_15(
      .id_0(id_13), .id_1(id_10), .id_2(($realtime)), .id_3((1 == -1 && 1 && id_10))
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_6,
      id_7,
      id_7,
      id_6,
      id_7,
      id_7,
      id_4,
      id_1,
      id_8,
      id_6,
      id_8
  );
  assign id_1 = 1;
  supply1 id_9;
  tri0 id_10;
  wire id_11 = 1 ? {-1'd0, id_9 && id_10} : id_11;
  specify
    (  posedge  id_12  =>  (  id_13  :  id_9  )  )  =  (  id_6  : $realtime |  id_5  [  ( $realtime )  ]  : $realtime , $realtime :  id_13  :  -1  )  ;
  endspecify
endmodule
