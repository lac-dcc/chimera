// Seed: 1435129125
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
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    output tri id_2
);
  wand id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  id_5 :
  assert property (@(*) -1) if (id_5 & (id_1)) id_4 = 1;
  wire id_6;
  assign id_2 = id_1;
endmodule
