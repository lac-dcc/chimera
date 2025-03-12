// Seed: 2510892079
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
  output reg id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_9;
  always @(id_7 or posedge 1) id_6 <= 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output reg id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4
  );
  logic id_5;
  wire  id_6 = id_4;
  always @(posedge 1) id_3 = id_6 - id_6;
endmodule
