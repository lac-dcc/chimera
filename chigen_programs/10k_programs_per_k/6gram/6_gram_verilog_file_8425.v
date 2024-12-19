// Seed: 1316587258
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
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_16;
  always
    if (id_7) id_10 = id_8;
    else begin : LABEL_0
      if (id_4) begin : LABEL_0
        id_10 = 1;
      end
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_3
  );
  wire id_4;
  wire id_5;
  reg  id_6;
  always force id_3 = 1;
  assign id_4 = 1;
  assign id_4 = id_2;
  always repeat (id_4) id_6 <= 1'b0;
endmodule
