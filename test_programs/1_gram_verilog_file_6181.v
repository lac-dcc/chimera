// Seed: 4201714708
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  wire id_8, id_9;
  assign module_1.id_2 = 0;
  always @("") id_2 = id_6 == id_7;
endmodule
module module_1 (
    input logic id_0
);
  assign id_2 = id_0;
  assign id_3 = id_0 - -1'b0;
  wire id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4
  );
  always id_2 = id_3;
  id_6 :
  assert property (@(negedge id_5) id_5 & 1) id_2 <= id_0;
endmodule
