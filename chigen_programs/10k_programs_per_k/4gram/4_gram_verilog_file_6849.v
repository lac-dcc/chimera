// Seed: 3510133546
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
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_6,
      id_4,
      id_6,
      id_3
  );
  always @(posedge id_4 or negedge 1'b0) id_6 += 1;
  assign id_2 = id_4;
endmodule
