// Seed: 2921718627
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
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  supply0 id_11 = $realtime;
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
    id_10
);
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_5,
      id_5,
      id_5,
      id_1,
      id_1,
      id_5,
      id_8,
      id_3
  );
  assign modCall_1.id_11 = 0;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
