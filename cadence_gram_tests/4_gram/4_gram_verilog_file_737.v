// Seed: 1126421332
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_4(
      .id_0($realtime), .id_1()
  );
  wire id_5;
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
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36,
    id_37,
    id_38
);
  inout wire id_38;
  output wire id_37;
  output wire id_36;
  inout wire id_35;
  output wire id_34;
  inout wire id_33;
  output wire id_32;
  output wire id_31;
  inout wire id_30;
  output wire id_29;
  input wire id_28;
  input wire id_27;
  input wire id_26;
  inout wire id_25;
  output wire id_24;
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(-1) begin : LABEL_0
    id_25 = id_6;
  end
  specify
    $setuphold(posedge id_39 &&& id_11, posedge id_40 &&& ~id_6, id_15, $realtime & 1'b0, id_41);
    (  negedge  id_42  =>  (  id_43  +:  id_19  )  )  =  ( $realtime :  -1  == $realtime :  id_42  , $realtime :  id_5  :  -1 'b0 )  ;
    (id_44 + => id_45) = ($realtime : id_23  : !id_27[1], $realtime : -1'b0 : 1);
  endspecify
  module_0 modCall_1 (
      id_36,
      id_25,
      id_38
  );
endmodule
