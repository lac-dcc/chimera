// Seed: 3527152527
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_8 :
  assert property (@(posedge 1) 1)
  else $display;
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_2,
      id_3
  );
  assign modCall_1.id_8 = 0;
  assign id_4[1] = 1;
endmodule
