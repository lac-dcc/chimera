// Seed: 3915306977
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8;
  logic [7:0] id_9 = id_6;
  assign id_7 = id_2[1'b0] ? 1 : 1;
  assign id_9[1] = 1;
endmodule
module module_1;
  wire id_1;
  wire id_2;
  logic [7:0] id_3;
  assign id_3[1] = 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_2,
      id_1,
      id_2,
      id_3,
      id_2
  );
endmodule
