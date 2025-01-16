// Seed: 3645527702
module module_0;
  uwire id_1;
  wand id_2;
  supply0 id_3 = id_1;
  id_4(
      -1'b0 - ""
  );
  logic [7:0] id_5;
  supply0 id_6, id_7 = id_2;
  always_latch @(posedge id_6) disable id_8;
  parameter id_9 = id_1;
  id_10(
      id_5[-1'b0], $realtime, id_8
  );
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
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always id_7 <= id_1;
  wire id_9;
  module_0 modCall_1 ();
  assign id_3 = id_8;
  assign id_3 = id_4;
  wire id_10;
  initial id_3 = id_8;
  always
    if ("") @(1);
    else @(*) id_3 <= -1;
endmodule
