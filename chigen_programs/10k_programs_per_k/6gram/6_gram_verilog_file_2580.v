// Seed: 284934741
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
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_10 = id_3;
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
  inout wire id_7;
  input wire id_6;
  output reg id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_7,
      id_4,
      id_7,
      id_4,
      id_2,
      id_2,
      id_3,
      id_7,
      id_1,
      id_2
  );
  always @(id_4) begin : LABEL_0
    id_5 = id_7;
  end
endmodule
