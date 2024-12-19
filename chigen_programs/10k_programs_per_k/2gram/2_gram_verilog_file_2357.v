// Seed: 3608183392
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5[1'b0] = 1;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  logic [7:0] id_7;
  assign id_1[1'b0] = {id_7[1]{id_3}};
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_2,
      id_7,
      id_4,
      id_2,
      id_2,
      id_6,
      id_6
  );
endmodule
