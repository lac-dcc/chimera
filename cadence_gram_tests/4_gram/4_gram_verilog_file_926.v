// Seed: 466179363
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
    id_10
);
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_8 = id_2;
  id_11(
      .id_0(id_9), .id_1(id_10), .id_2(1)
  );
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  assign id_1 = 1;
  assign id_2 = $realtime;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3
  );
  wire id_4 = id_3;
endmodule
