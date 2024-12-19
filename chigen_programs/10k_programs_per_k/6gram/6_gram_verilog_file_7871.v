// Seed: 1783543188
program module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  assign id_2 = (1 + 1'b0);
endprogram
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_5,
      id_6,
      id_2
  );
  assign modCall_1.id_5 = 0;
  wire id_8;
  wire id_9;
  assign id_5[1] = 1;
endmodule
