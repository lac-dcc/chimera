// Seed: 505087311
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  assign id_4 = $realtime;
  specify
    (posedge id_8 => (id_9  : id_1)) = ($realtime : 1  : id_7, id_9  : $realtime : -1'd0);
    $width(negedge id_10, id_2, id_10, id_11);
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
    id_12
);
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_13(
      .id_0(), .id_1($realtime), .id_2(), .id_3()
  ); id_14(
      .id_0(-1'b0),
      .id_1(1),
      .id_2(id_12),
      .id_3(-1),
      .id_4(-1),
      .id_5(1),
      .id_6($realtime & id_11),
      .id_7(($realtime)),
      .id_8($realtime),
      .id_9(-1'b0),
      .id_10(id_3[1])
  );
  wire id_15;
  wire id_16;
  id_17(
      -1 & -1'b0, $realtime
  );
  wire id_18;
  id_19(
      .id_0($realtime | id_10 | id_4), .id_1(id_17), .id_2(id_1), .id_3(id_11)
  );
  wire id_20 = -1;
  wire id_21;
  wire id_22;
  module_0 modCall_1 (
      id_20,
      id_11,
      id_20,
      id_4,
      id_15,
      id_12
  );
endmodule
