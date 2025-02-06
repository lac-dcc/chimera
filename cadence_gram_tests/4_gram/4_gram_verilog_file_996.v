// Seed: 2142004889
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
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18 = $realtime ? 1 : id_14;
  specify
    (posedge id_19 => (id_20 +: $realtime)) = (1'b0 : $realtime : 1'b0, id_13  : id_11  : id_17);
    $setuphold(negedge id_21, negedge id_22, -1, id_11);
    (posedge id_23 => (id_24 -: -1)) = (-1  : id_11  : $realtime, 1'b0 : id_12  : (-1'b0 | id_18));
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
    id_25
);
  output wire id_25;
  output wire id_24;
  output wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire \id_26 ;
  id_27(
      .id_0($realtime)
  ); id_28(
      .id_0(id_2), .id_1($realtime), .id_2(id_3[1]), .id_3()
  );
  module_0 modCall_1 (
      id_8,
      id_25,
      id_4,
      id_1,
      id_6,
      id_18,
      id_13,
      id_20
  );
endmodule
