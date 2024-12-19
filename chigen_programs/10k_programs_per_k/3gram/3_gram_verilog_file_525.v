// Seed: 815538775
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_8;
  wire id_9;
  always @(1'b0 or posedge 1'b0) assume (id_3);
  wire id_10;
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1;
  assign id_1 = 1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
