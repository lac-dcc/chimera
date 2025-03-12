// Seed: 2277047465
module module_0 (
    id_1,
    id_2,
    id_3
);
  output logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  parameter id_4 = 1 | 1;
  struct packed {logic id_5[-1 'h0 : ""];} id_6;
  wire id_7, id_8;
  assign id_3[1] = id_1;
endmodule
module module_1 #(
    parameter id_9 = 32'd94
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = (~1);
  logic id_7;
  logic id_8;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4
  );
  assign id_5 = id_8;
  wire [1 : -1] _id_9;
  always_comb id_4[id_9 : id_9] = -1;
  assign id_6 = id_3;
  assign id_5 = id_1;
  wire id_10;
endmodule
