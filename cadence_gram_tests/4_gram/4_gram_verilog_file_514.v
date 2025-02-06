// Seed: 1824221482
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
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  wand id_9;
  assign id_1 = 1 ? id_9 : $realtime;
  wire id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  wire id_17;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  specify
    (id_2 + => id_3) = ($realtime : id_2  : id_3, $realtime : id_3  : $realtime & id_3);
  endspecify
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3
  );
endmodule
