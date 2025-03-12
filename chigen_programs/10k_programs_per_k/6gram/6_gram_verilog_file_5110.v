// Seed: 2236025758
module module_0 (
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
  inout wire id_1;
  wire id_7;
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
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  inout reg id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  nor primCall (id_4, id_2, id_1, id_5, id_10, id_7, id_14, id_13, id_8, id_15);
  output wire id_3;
  input wire id_2;
  inout reg id_1;
  module_0 modCall_1 (
      id_8,
      id_15,
      id_4,
      id_4,
      id_9,
      id_4
  );
  always @(posedge 1 or -1) begin : LABEL_0
    id_14 = -1;
    if (-1 - (1) && 1) id_1 <= id_13;
  end
endmodule
