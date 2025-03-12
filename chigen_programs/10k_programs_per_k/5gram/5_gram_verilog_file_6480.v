// Seed: 1738001152
module module_0 (
    output tri1  id_0,
    input  wand  id_1,
    input  uwire id_2,
    output tri1  id_3,
    input  tri   id_4,
    input  wand  id_5
);
  wire \id_7 ;
  logic [-1 : -1] id_8;
  wire id_9;
  assign module_1.id_20 = 0;
endmodule
module module_1 #(
    parameter id_17 = 32'd83,
    parameter id_6  = 32'd41
) (
    output wand id_0,
    input wire id_1,
    input wire id_2,
    output wor id_3,
    input uwire id_4,
    input tri id_5,
    output tri _id_6,
    input supply0 id_7,
    output supply1 id_8,
    input tri0 id_9,
    input wor id_10,
    output tri1 id_11,
    input supply1 id_12,
    input uwire id_13,
    output uwire id_14,
    input wire id_15,
    input tri1 id_16,
    input tri1 _id_17,
    input tri1 id_18,
    input tri id_19,
    output tri0 id_20,
    input supply0 id_21,
    inout wand id_22
);
  localparam id_24 = 1;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_1,
      id_3,
      id_9,
      id_2
  );
  logic [-1 : ""] id_25;
  logic [-1 : id_17  &  id_6] id_26, id_27;
  wire id_28;
  always_latch @(posedge id_10) {id_4 | -1, -1'h0} = -1;
  assign id_22 = 1;
endmodule
