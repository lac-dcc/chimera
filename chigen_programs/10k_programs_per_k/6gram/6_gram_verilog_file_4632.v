// Seed: 235003633
module module_0 (
    output wand id_0,
    input wire id_1,
    output supply1 id_2,
    output tri1 id_3,
    input wor id_4,
    input supply0 id_5,
    input wand id_6,
    input tri0 id_7,
    input tri0 id_8,
    input wor id_9
    , id_13,
    input tri1 id_10,
    output tri0 id_11
);
  tri1 id_14;
  wire id_15;
  assign id_0 = -1'd0;
  parameter id_16 = 1 < 1;
  localparam id_17 = -1;
  assign id_3 = id_4;
  wire id_18;
  wire id_19;
  parameter id_20 = 1;
  assign id_19 = id_6;
  assign id_11 = id_10;
  assign id_14 = 1'h0;
endmodule
module module_1 #(
    parameter id_11 = 32'd72,
    parameter id_3  = 32'd36
) (
    output uwire id_0,
    input  uwire id_1,
    output logic id_2,
    input  wor   _id_3
);
  always
    while (-1'b0) begin : LABEL_0
      id_2 <= id_1;
    end
  parameter id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
  logic id_6;
  ;
  wire [-1 : id_3  #  (  -1  )] id_7;
  wire id_8;
  parameter integer id_9 = 1;
  parameter id_10 = 1;
  logic _id_11;
  ;
  assign id_0 = id_5[id_11 :-1];
endmodule
