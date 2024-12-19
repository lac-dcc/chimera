// Seed: 344415326
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    module_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wand id_8;
  and primCall (id_6, id_1, id_8, id_3, id_5, id_9, id_4);
  always @(1 or negedge id_1) id_2 = id_6[1'b0];
  wire id_9 = ~id_8;
  module_0 modCall_1 (
      id_3,
      id_8
  );
  assign id_2 = 1;
  wire id_10;
endmodule
