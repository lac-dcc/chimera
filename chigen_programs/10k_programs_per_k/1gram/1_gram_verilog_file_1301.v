// Seed: 823211622
module module_0 #(
    parameter id_9 = 32'd77
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7[-1 :-1],
    id_8
);
  input wire id_8;
  inout logic [7:0] id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_9 = 1;
  wire id_10, id_11;
  defparam id_9 = id_9, id_9 = id_9, id_9 = id_9;
  parameter id_12 = id_9;
  parameter id_13 = 1;
endmodule
module module_1 (
    output tri id_0,
    input  tri id_1
);
  struct packed {
    logic id_3;
    id_4  id_5;
  } id_6;
  parameter id_7 = 1;
  logic id_8;
  ;
  id_9 :
  assert property (@(1) (1)) begin : LABEL_0
    if (id_7) id_6 <= 1'h0;
  end
  assign id_6.id_5 = id_9;
  assign id_6.id_3 = -1;
  logic id_10;
  wire id_11, id_12;
  localparam id_13 = id_7 & id_7 + id_7[-1];
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_13,
      id_9,
      id_11,
      id_7,
      id_6.id_3
  );
  supply0 id_14;
  wire id_15, id_16;
  assign id_14 = 1;
endmodule
