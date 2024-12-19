// Seed: 2569729170
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
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
  integer id_13;
  wire id_14;
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
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(negedge id_4)
    if (id_4) id_4 <= ~id_1 && ~id_7;
    else id_4 <= id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_1,
      id_1,
      id_5,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_8
  );
  specify
    (id_9 => id_10) = (id_10, 1);
    (id_11 => id_12) = 1;
    (id_13 => id_14) = (id_5  : 1  : ~1, id_5.id_11  : ~id_5  : id_4 !=? 1'h0);
    (id_15 => id_16) = 1;
    specparam id_17 = 1;
  endspecify
endmodule
