// Seed: 3937256962
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_17 = 1'b0 + id_6;
  logic id_18;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output reg id_2;
  bufif0 primCall (id_1, id_3, id_4);
  inout wire id_1;
  initial begin : LABEL_0
    $unsigned(21);
    ;
    if (1) id_2 <= id_4 == 1'b0;
    else id_2 = -1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_1,
      id_1
  );
endmodule
