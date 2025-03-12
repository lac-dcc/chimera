// Seed: 3927590188
module module_0 (
    id_1
);
  output wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd46,
    parameter id_5 = 32'd29,
    parameter id_6 = 32'd13,
    parameter id_7 = 32'd57
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    _id_6,
    _id_7,
    id_8
);
  output wire id_8;
  output wire _id_7;
  input wire _id_6;
  input wire _id_5;
  output wire id_4;
  input wire id_3;
  inout wire _id_2;
  input wire id_1;
  localparam id_9 = 1'h0;
  module_0 modCall_1 (id_8);
  struct packed {
    logic [-1 : 1] id_10;
    logic [1 : id_6] id_11;
    logic id_12;
    logic [id_5 : 1] id_13;
    struct packed {id_14 id_15;} [id_6 : id_2] id_16;
    id_17 id_18;
    logic [1 : -1] id_19;
    logic [id_7 : -1] id_20;
  } [1 : ""] id_21;
endmodule
