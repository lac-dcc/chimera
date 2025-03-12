// Seed: 4034681969
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_4 = 1;
  logic   id_5;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd53,
    parameter id_2 = 32'd19,
    parameter id_3 = 32'd71,
    parameter id_4 = 32'd55,
    parameter id_9 = 32'd80
) (
    _id_1,
    _id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  output reg id_12;
  output wire id_11;
  output wire id_10;
  inout wire _id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  and primCall (id_11, id_6, id_13, id_16, id_15, id_7, id_8, id_14);
  inout wire _id_4;
  inout wire _id_3;
  inout wire _id_2;
  inout wire _id_1;
  final $clog2(70);
  ;
  initial id_12 = #1 id_2;
  wire [-1 'b0 : id_4] id_15, id_16;
  module_0 modCall_1 (
      id_13,
      id_6,
      id_6
  );
  logic [7:0][id_1  ?  -1 : 1  |  id_3  |  -1 'h0 : id_9] id_17;
  assign id_17[id_2==1] = id_2;
endmodule
