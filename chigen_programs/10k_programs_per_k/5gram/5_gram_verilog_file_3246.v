// Seed: 1416289984
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10;
  wire id_11;
  wire id_12;
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
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  initial begin : LABEL_0
    id_5 <= 1;
    wait (1'b0 - 1'b0);
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_7,
      id_8,
      id_6,
      id_7,
      id_4
  );
  assign id_2 = id_5;
endmodule
