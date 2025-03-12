// Seed: 2513155295
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
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
  module_0 modCall_1 (
      id_1,
      id_3,
      id_7
  );
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_8;
  wire  id_9;
  wire  id_10;
  logic id_11;
endmodule
program module_2 #(
    parameter id_4 = 32'd20,
    parameter id_6 = 32'd14
) (
    output tri   id_0,
    output wire  id_1,
    input  wire  id_2,
    output uwire id_3,
    input  tri0  _id_4
);
  wire [1  &  1 : id_4] _id_6;
  logic [7:0][id_4  *  id_6] id_7;
  struct packed {
    logic   id_8;
    integer id_9  = -1;
  } id_10;
  module_0 modCall_1 (
      id_10,
      id_7,
      id_7
  );
endprogram
