// Seed: 3051514057
module module_0 ();
  assign id_1 = 1;
  wire id_2, id_3;
  tri1 id_4;
  genvar id_5;
  always id_5 <= id_4 <= 1'b0;
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
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4.id_6 = id_10;
  wire id_13;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire  id_14;
  uwire id_15;
  id_16 :
  assert property (@(posedge id_10) id_8)
    if (id_10) $display((id_10), 1 - id_1, id_7);
    else
      @(posedge id_11)
        if (1) $display;
        else id_16 <= id_15 | id_6;
  always id_6 = 1;
  wire id_17;
endmodule
