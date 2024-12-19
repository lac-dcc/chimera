// Seed: 924008469
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  wire id_9;
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
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  initial @(id_7[1+:1'b0]) id_6 <= 1'b0;
  always_latch $display(id_1);
  xor primCall (id_6, id_4, id_1, id_2, id_10, id_7);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_10,
      id_2,
      id_4,
      id_10,
      id_11
  );
  wire id_12;
endmodule
