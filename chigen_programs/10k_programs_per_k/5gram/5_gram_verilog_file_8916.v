// Seed: 70933868
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
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_21;
endmodule
module module_1 (
    output tri0 id_0
    , id_4,
    output wire id_1,
    output tri1 id_2
);
  wire id_5;
  tri0 id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_5,
      id_5,
      id_4,
      id_6,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_6,
      id_5,
      id_6,
      id_4
  );
  id_7 :
  assert property (@(posedge {1 && 1 == id_6, 1}) id_6)
  else $display;
endmodule
