// Seed: 807249493
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
    id_11
);
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_12;
  wire id_13;
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
    id_24
);
  input wire id_24;
  output wire id_23;
  input wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_25;
  assign id_23 = $realtime;
  id_26(
      .id_0(id_1),
      .id_1($realtime),
      .id_2($realtime),
      .id_3(),
      .id_4(-1),
      .id_5(id_14),
      .id_6(1),
      .id_7(id_4),
      .id_8(id_15),
      .id_9($realtime),
      .id_10((id_24[1])),
      .id_11()
  );
  module_0 modCall_1 (
      id_20,
      id_19,
      id_4,
      id_5,
      id_9,
      id_19,
      id_25,
      id_17,
      id_18,
      id_1,
      id_19
  );
  assign id_20 = $realtime;
  nmos (id_20, id_18);
endmodule
