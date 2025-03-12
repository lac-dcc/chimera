// Seed: 1922231224
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output tri1 id_2,
    output tri0 id_3,
    input supply0 id_4
);
  assign id_2 = -1;
  logic id_6;
  ;
  assign id_2 = id_6;
  assign module_1.id_3 = 0;
  localparam id_7 = 1;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input wire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_2,
      id_3
  );
endmodule
module module_2 #(
    parameter id_9 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout logic [7:0] id_10;
  inout wire _id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign module_3.id_2 = 0;
  assign id_10[id_9]   = id_9;
endmodule
module module_3 #(
    parameter id_2 = 32'd50,
    parameter id_6 = 32'd36
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  output wire id_4;
  output reg id_3;
  input wire _id_2;
  input logic [7:0] id_1;
  logic ['h0 : id_2] id_5 = id_1[-1-id_2];
  parameter id_6 = $unsigned(id_6);
  ;
  assign id_5[id_6] = {-1, id_2} < -1 * id_2;
  always id_3 <= id_5;
  always {id_6, -1 - id_2} <= -1'd0;
  logic id_7 = 1'b0;
  parameter id_8 = id_6;
  wire id_9;
  module_2 modCall_1 (
      id_4,
      id_7,
      id_7,
      id_7,
      id_8,
      id_8,
      id_7,
      id_8,
      id_6,
      id_5,
      id_8
  );
endmodule
