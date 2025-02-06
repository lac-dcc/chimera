// Seed: 3388474854
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
    id_12
);
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_6 = id_11 ? -1'b0 : ~$realtime;
  \id_13 (
      1'b0, -1
  );
  wire id_14;
  wor  id_15 = $realtime;
  assign id_9 = id_2 ? $realtime : -1;
  wire id_16;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  uwire id_3 = -1'b0;
  wire  id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_1,
      id_1,
      id_1
  );
  wire id_5, id_6;
  assign id_2 = id_2[$realtime];
endmodule
