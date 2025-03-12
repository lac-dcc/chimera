// Seed: 566226161
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_5 = id_5 & (id_2);
  wire  id_6;
endmodule
module module_1 #(
    parameter id_1  = 32'd72,
    parameter id_10 = 32'd25,
    parameter id_4  = 32'd44
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10
);
  input wire _id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire _id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  input wire _id_1;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_9,
      id_5
  );
  assign id_2[-1] = id_10;
  struct packed {
    logic [1 'h0 : 1] id_11;
    struct packed {
      logic [id_1 : (  id_4  )] id_12;
      id_13 id_14;
    } [~  1 : id_1] id_15;
  } [-1 : id_10] id_16;
endmodule
