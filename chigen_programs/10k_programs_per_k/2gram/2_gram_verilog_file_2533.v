// Seed: 1833754978
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
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = 1;
  assign module_1.id_1 = 0;
  assign id_1 = id_3;
  wire id_16;
  wire id_17 = id_8;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  always_latch begin : LABEL_0
    disable id_2;
    wait (id_2);
  end
  assign id_1 = 1 ? 1 : id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
endmodule
