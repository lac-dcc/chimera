// Seed: 614995720
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
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
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
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_7,
      id_5,
      id_6,
      id_7,
      id_7,
      id_1,
      id_1,
      id_6
  );
  wire id_9;
  specify
    (negedge id_10 => (id_11  : $realtime)) = (1  : -1  : id_7, -1  : id_4[$realtime] : id_6);
    (id_12 + => id_13) = ($realtime : 1  : $realtime, 1  : id_3  : id_1);
  endspecify
endmodule
