// Seed: 3466589069
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
    id_12
);
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wor id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  parameter id_13 = 1;
  parameter id_14 = -1 & 1;
  logic id_15;
  assign id_7 = id_15[-1 :-1] ? id_3 : -1;
  wire id_16;
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
    id_15,
    id_16
);
  inout wire id_16;
  input wire id_15;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_5,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_16,
      id_13,
      id_6
  );
  output wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout tri0 id_5;
  input wire id_4;
  output reg id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5  = id_2 == 1;
  assign id_14 = id_4;
  generate
    always @({id_15{-1 - -1}}) begin : LABEL_0
      id_3 <= id_16;
    end
  endgenerate
endmodule
