// Seed: 2252051839
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
  assign id_3 = 1;
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
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_1
  );
  wand id_9, id_10;
  always @(posedge id_7) id_8 = id_7[1] == 1'b0;
  assign id_8 = id_9;
  id_11 :
  assert property (@(posedge id_10) 1)
  else $display;
  assign id_2 = 1;
  id_12(
      1 == "", 1'h0
  );
endmodule
