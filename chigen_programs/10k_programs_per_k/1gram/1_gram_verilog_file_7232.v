// Seed: 560885125
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_6
  );
  id_8 :
  assert property (@(1) id_4) id_8 <= id_7 == 1'b0;
endmodule
