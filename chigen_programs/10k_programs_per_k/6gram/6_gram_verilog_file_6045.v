// Seed: 1103935911
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always
    while (-1)
      @(posedge id_18) begin : LABEL_0
        wait (1);
      end
endmodule
module module_1 #(
    parameter \id_7 = 32'd4,
    parameter id_8  = 32'd39
) (
    input  wand  id_0,
    output tri0  id_1,
    input  tri0  id_2,
    output wor   id_3,
    input  uwire id_4,
    input  tri0  id_5
);
  wire _ \id_7 ;
  localparam id_8 = ~(1);
  wire id_9;
  integer [1 : id_8] id_10;
  ;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_10,
      id_9,
      id_10,
      id_10,
      id_9,
      id_9,
      id_10,
      id_10,
      id_10,
      id_9,
      id_10,
      id_9,
      id_9
  );
  logic [-1 : -1 'b0 -  -1] id_11;
  assign id_11[-1 : \id_7 ] = id_4#(.id_5(1'd0)) ? \id_7 : id_11;
endmodule
