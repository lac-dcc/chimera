// Seed: 2428018151
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
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_11 = id_8;
  id_14 :
  assert property (@(id_8) id_9)
  else begin : LABEL_0
    if (1) id_11 = 1'd0;
  end
  assign id_2 = id_2;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_1,
      id_7,
      id_7,
      id_6,
      id_7,
      id_4,
      id_7,
      id_1,
      id_8,
      id_7
  );
  assign modCall_1.id_14 = 0;
endmodule
