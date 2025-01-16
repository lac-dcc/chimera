// Seed: 3813721329
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
    id_15
);
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_16;
  assign id_13 = 1;
  assign id_1  = 1'b0 && id_7;
  wire id_17;
  wire id_18, id_19;
  wire id_20;
  assign (pull1, strong0) id_12 = -1'b0;
  assign module_1.id_1 = 0;
  assign id_16 = id_3;
  wire id_21;
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
    id_11
);
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always begin : LABEL_0
    id_1 <= $display();
  end
  module_0 modCall_1 (
      id_2,
      id_4,
      id_10,
      id_9,
      id_9,
      id_2,
      id_11,
      id_9,
      id_11,
      id_11,
      id_9,
      id_8,
      id_6,
      id_4,
      id_4
  );
  wire id_12;
  assign id_2 = -1;
  id_13(
      id_5, id_3, id_3
  );
  logic [7:0] id_14;
  wire id_15;
  wire id_16;
  wire id_17;
  if (1) id_18(id_5[1 : 1'b0]);
  else assign id_14 = (id_5);
  wire id_19, id_20;
endmodule
