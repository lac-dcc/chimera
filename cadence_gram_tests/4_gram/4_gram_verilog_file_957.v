// Seed: 3847399670
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_9;
  wire id_20;
  assign module_1.id_25 = 0;
  assign id_10 = id_2;
  assign id_13 = -1'b0 ? id_2 : id_6;
  assign id_14 = id_5 ? id_8 : ($realtime);
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_20;
  module_0 modCall_1 (
      id_20,
      id_12,
      id_20,
      id_4,
      id_6,
      id_20,
      id_6,
      id_12,
      id_20,
      id_9,
      id_6,
      id_5,
      id_11,
      id_12,
      id_17,
      id_1,
      id_20,
      id_7,
      id_11
  );
  id_21(
      .id_0($realtime),
      .id_1(1),
      .id_2($realtime),
      .id_3(id_2 == 1'b0),
      .id_4(1),
      .id_5(),
      .id_6($realtime),
      .id_7($realtime),
      .id_8()
  ); specify
    if  (  -1  )  (  negedge  id_22  =>  (  id_23  :  1  )  )  =  (  id_17  ==  -1  : $realtime :  -1 'b0 ,  1  : $realtime : $realtime )  ;
    $hold(negedge id_24, negedge id_25, 1'b0);
    (id_26 - => id_27) = (id_12  : -1  : $realtime,
                          $realtime : -1 && $realtime && $realtime : id_2);
  endspecify
endmodule
