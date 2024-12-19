// Seed: 328889093
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
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
  assign id_4 = id_6 ? 1 : 1;
  wire id_10;
  always force id_4 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_7[1] <= 1;
    if (1) begin : LABEL_0
      id_6 <= id_5;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4,
      id_5,
      id_2
  );
endmodule
