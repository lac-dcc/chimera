// Seed: 3944164296
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
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_19, id_20 = id_14;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input logic id_0
    , id_2
);
  reg id_3, id_4, id_5;
  reg id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  always begin : LABEL_0
    if (id_4 - id_5) id_6 <= id_4;
    id_3 <= (id_0);
  end
  always_comb
    if (1) id_3 <= 1 == id_4;
    else $display(1, 1);
endmodule
