// Seed: 2882517986
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  assign module_1.id_4 = 0;
  inout wire id_2;
  output wire id_1;
  parameter id_10 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd35,
    parameter id_4 = 32'd95,
    parameter id_5 = 32'd98
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6
);
  output wire id_6;
  input wire _id_5;
  input wire _id_4;
  input logic [7:0] id_3;
  output uwire id_2;
  inout wire _id_1;
  assign id_2 = id_3 - id_3[-1 :-1<->id_5];
  assign id_6 = ~id_4 - id_1;
  wire [id_1  ||  id_1  -  id_5  ||  -1 : id_4] id_7;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_7,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      id_7
  );
  always
    if (({-1, (-1)})) #1;
    else cover (id_4);
endmodule
