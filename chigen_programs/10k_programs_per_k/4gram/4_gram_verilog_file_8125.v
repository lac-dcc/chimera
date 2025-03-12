// Seed: 3072411762
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input tri id_2,
    input wire id_3,
    output tri0 id_4,
    output uwire id_5,
    output supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10,
    output uwire id_11,
    input wor id_12,
    input tri0 id_13,
    input wand id_14,
    input wire id_15,
    input uwire id_16
);
  assign id_11 = id_2;
  assign module_1.id_1 = 0;
  struct packed {
    logic [-1 : 1 'b0] id_18;
    logic [-1 : 1] id_19;
  } id_20;
  assign id_1 = id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd26,
    parameter id_3 = 32'd93,
    parameter id_6 = 32'd86
) (
    output wor   id_0,
    input  tri0  id_1,
    input  wor   _id_2,
    input  uwire _id_3,
    inout  tri1  id_4
);
  final $clog2(23);
  ;
  wire _id_6;
  logic [id_3 : id_2] id_7;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_0,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_0,
      id_1,
      id_4,
      id_1,
      id_4,
      id_4
  );
  assign id_0 = id_2;
  final $unsigned(92);
  ;
  logic [1 : id_6] id_8;
  logic [id_2  &  id_3 : 1 'b0] id_9;
  ;
endmodule
