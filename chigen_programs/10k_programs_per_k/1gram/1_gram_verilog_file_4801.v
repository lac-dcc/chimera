// Seed: 3132853237
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output reg id_6;
  output reg id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5 = 1 - $signed(42);
  ;
  wire id_7;
  initial
    if (1) id_5 <= -1;
    else id_6 <= id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output reg id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
  initial begin : LABEL_0
    id_1 <= id_3;
  end
endmodule
