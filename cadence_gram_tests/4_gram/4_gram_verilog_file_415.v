// Seed: 3002656107
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = 1'b0 ? $realtime : id_3;
  assign module_1.id_10 = 0;
  wire id_9;
  wire id_10;
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
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_4,
      id_6,
      id_1,
      id_6,
      id_6
  );
  tri id_8;
  specify
    (  posedge  id_9  =>  (  id_10  :  -1 'd0 )  )  =  ( $realtime :  id_4  : $realtime ,  id_9  :  id_9  :  id_3  + $realtime )  ;
    $width(negedge id_11 &&& -1, id_8, id_5, id_12);
  endspecify
endmodule
