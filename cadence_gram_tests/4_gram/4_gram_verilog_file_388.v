// Seed: 1339459946
module module_0 (
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
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_10;
  wire id_11;
  assign module_1.id_3 = 0;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = $realtime ? id_1 : -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3
  );
  wand id_5;
  specify
    (id_6 + => id_7) = ($realtime : id_5  : $realtime, (1): id_3  : $realtime);
  endspecify
endmodule
