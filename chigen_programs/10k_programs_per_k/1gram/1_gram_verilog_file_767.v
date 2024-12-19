// Seed: 2133463386
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = 1;
  assign module_1.id_4 = 0;
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
    id_9
);
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_10 :
  assert property (@(negedge id_5, id_1) id_1)
    if (1 & id_4) id_6 <= id_7;
    else id_2 <= id_10;
  module_0 modCall_1 (id_8);
  assign id_2 = 1;
endmodule
