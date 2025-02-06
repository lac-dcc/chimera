// Seed: 3315725438
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire \id_8 ;
  wire id_9;
  assign \id_8 = id_4[1'b0];
  assign id_5  = -1;
  supply0 id_10 = -1'b0;
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
    id_9
);
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = id_1;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_6,
      id_10,
      id_8,
      id_6,
      id_6,
      id_7
  );
  assign id_8[1] = $realtime;
  wire id_11;
  wire id_12;
  assign id_5 = 1'b0;
  assign id_5 = id_6;
  logic [7:0] id_13;
  id_14(
      .id_0($realtime),
      .id_1(id_13),
      .id_2($realtime),
      .id_3((-1)),
      .id_4($realtime),
      .id_5(),
      .id_6(id_7),
      .id_7(id_3),
      .id_8((id_13[$realtime])),
      .id_9(-1'b0),
      .id_10(1),
      .id_11(1'b0),
      .id_12($realtime),
      .id_13(),
      .id_14(1'b0),
      .id_15($realtime),
      .id_16(),
      .id_17(id_4),
      .id_18(-1),
      .id_19(-1),
      .id_20(1)
  );
  wire id_15;
endmodule
