// Seed: 2728841415
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output tri0 id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_4;
  assign id_5 = 'd0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output reg id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1
  );
  reg id_4;
  always @(*)
    if (1)
      if (1) id_4 <= 1;
      else begin : LABEL_0
        id_3 <= id_1;
      end
  wire id_5;
endmodule
