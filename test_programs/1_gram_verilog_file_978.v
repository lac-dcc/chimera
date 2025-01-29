// Seed: 1060409891
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wand id_5 = {1, 1};
  wire id_6;
  assign module_1.id_5 = 0;
  always_comb id_5 = -1;
  parameter id_7 = 1;
  always_latch id_3 <= -1'b0 && 1;
  assign id_4 = id_2;
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
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_9 = 1;
  module_0 modCall_1 (
      id_5,
      id_9,
      id_4,
      id_9
  );
  id_10 :
  assert property (@(posedge -1 * id_10 ? id_7 < id_5 : 1) -1)
  else id_4 <= id_6;
endmodule
