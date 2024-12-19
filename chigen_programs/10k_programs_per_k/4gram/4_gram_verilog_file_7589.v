// Seed: 252123632
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
    id_17
);
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_7  <= "";
    id_17 <= id_16;
    id_14 <= 1;
    id_7  <= id_13;
    id_8  <= id_1;
    id_14 = (1);
  end
  generate
    wire id_18;
  endgenerate
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
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always
    if (id_4) id_2 <= 1;
    else begin : LABEL_0
      id_6 <= id_4;
    end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_6,
      id_6,
      id_7,
      id_1,
      id_7,
      id_1,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4
  );
endmodule
