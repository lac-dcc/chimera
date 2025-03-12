// Seed: 2798700247
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  parameter id_6 = -1'b0;
  localparam id_7 = -1 && 1'b0;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    output tri   id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
  localparam id_5 = 1;
  logic [7:0] id_6;
  assign id_6[-1] = id_0;
endmodule
module module_2 #(
    parameter id_1 = 32'd80
) (
    _id_1,
    id_2,
    id_3
);
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3
  );
  input wire id_2;
  inout wire _id_1;
  struct packed {
    logic [id_1 : ""] id_4;
    logic id_5;
    logic id_6;
    logic id_7;
    logic [-1 'b0 : 1] id_8;
    struct packed {
      logic id_9;
      logic [-1 : -1] id_10;
    } id_11;
  } [1 : id_1] id_12;
  wire id_13;
  buf primCall (id_3, id_2);
endmodule
