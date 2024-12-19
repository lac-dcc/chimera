// Seed: 2563208936
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
    id_11
);
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_12;
  assign id_3 = (1'h0);
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
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(negedge 1)
    if (id_6 == 1 && {id_5, 1}) id_6 <= 1;
    else begin : LABEL_0
      id_5 <= 1;
    end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_3,
      id_4,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1
  );
endmodule
