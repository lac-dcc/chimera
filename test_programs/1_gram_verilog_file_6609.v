// Seed: 1284387926
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_7 :
  assert property (@(posedge -1 or posedge 1'b0 || id_7 or negedge -1'b0) id_1) id_2 = id_7;
  wand id_8;
  wire id_9;
  assign id_8 = 1;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  wire id_2;
  wire id_3, id_4, id_5;
  wire id_6, id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1
  );
endmodule
