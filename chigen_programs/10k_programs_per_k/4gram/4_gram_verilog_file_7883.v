// Seed: 3534721625
module module_0 (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  input wire id_1;
  assign id_2[-1'b0] = 1;
  tri0 id_3 = 1;
  assign id_3 = id_2 == -1;
endmodule
module module_1 #(
    parameter id_12 = 32'd42,
    parameter id_3  = 32'd32,
    parameter id_7  = 32'd96,
    parameter id_8  = 32'd79
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire _id_8;
  input wire _id_7;
  output wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  module_0 modCall_1 (
      id_9,
      id_4
  );
  output wire _id_3;
  output logic [7:0] id_2;
  output wire id_1;
  logic [-1 : id_8] _id_12;
  generate
    assign id_2[id_7] = id_4[!id_12];
  endgenerate
  logic id_13;
  wire [-1 : 1 'b0 <<  1  &&  1 'd0 &&  1] id_14;
  assign id_13 = 1'b0 ? id_4[id_12 : ""^1] : -1;
  wire id_15;
  struct packed {
    logic [id_12 : 1] id_16;
    logic [id_3 : 1  -  -1] id_17;
  } id_18;
endmodule
