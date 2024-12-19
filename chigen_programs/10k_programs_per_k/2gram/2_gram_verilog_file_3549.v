// Seed: 3930400153
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  uwire id_9;
  initial id_7 = id_1;
  assign id_8 = 1'b0;
  supply0 id_10 = 1;
  initial begin : LABEL_0
    id_9 = 1;
  end
  assign id_4 = id_9;
  wire id_11;
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_9;
  reg id_10 = 1;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_7,
      id_5,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_10 = 0;
  always_latch #1 begin : LABEL_0
    id_9 <= id_3 * id_2 * id_8[1'b0];
    if (1) id_1 <= id_6;
    $display;
    id_2 <= id_10;
  end
  wire id_11;
  wire id_12;
endmodule
