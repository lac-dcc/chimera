// Seed: 2229641498
module module_0 #(
    parameter id_4 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  output wire _id_4;
  inout supply0 id_3;
  inout wire id_2;
  output supply1 id_1;
  logic id_5;
  assign id_3 = -1;
  assign module_1.id_5 = 0;
  assign id_1 = 1'b0;
  logic id_6;
  ;
  logic [id_4  <  1 'd0 : 1] id_7;
  ;
endmodule
module module_1 #(
    parameter id_5 = 32'd91,
    parameter id_8 = 32'd88
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6
);
  input wire id_6;
  output wire _id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  logic [1 : id_5] id_7;
  assign id_7 = 1'b0;
  parameter id_8 = 1;
  wire  id_9;
  logic id_10;
  assign id_7 = -1;
  wire [id_8 : 1  *  -1] id_11;
  wire id_12 = id_12;
  wire id_13;
  assign id_10 = id_3;
  localparam id_14 = id_8;
  assign id_2 = id_3;
  wire id_15, id_16;
  module_0 modCall_1 (
      id_14,
      id_12,
      id_3,
      id_8
  );
  initial
  fork : SymbolIdentifier
  join
  assign id_4[-1] = id_15 ? id_12 : id_11 ? -1 : "";
endmodule
