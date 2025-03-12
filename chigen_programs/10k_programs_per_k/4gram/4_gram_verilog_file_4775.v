// Seed: 2387163584
module module_0 #(
    parameter id_1 = 32'd16,
    parameter id_2 = 32'd14,
    parameter id_4 = 32'd85,
    parameter id_8 = 32'd75
) ();
  wire _id_1;
  logic _id_2;
  logic [7:0] id_3;
  ;
  wire [1 : id_2] _id_4;
  assign id_3[id_2] = 1;
  wire id_5;
  assign id_5 = id_3;
  always @(posedge 1'b0) begin : LABEL_0
    disable id_6;
  end
  wire id_7;
  logic [id_4 : id_1] _id_8;
  wire [id_4 : id_2] id_9;
  assign module_1.id_18 = 0;
  assign id_3 = module_0;
  logic [1 : id_8] id_10;
  assign id_9 = id_3;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    input wand id_2,
    input tri id_3,
    input wand id_4,
    input tri1 id_5,
    output uwire id_6,
    output supply0 id_7,
    input tri0 id_8,
    input tri id_9,
    input wire id_10,
    output tri0 id_11,
    input tri1 id_12,
    input supply0 id_13,
    input supply0 id_14,
    input supply1 id_15,
    input tri1 id_16,
    output wand id_17,
    input tri0 id_18
);
  wire id_20;
  logic id_21, id_22;
  wire id_23;
  wire id_24;
  module_0 modCall_1 ();
  assign id_17 = id_21;
  always_comb #1 if (-1) id_22 <= -1'b0;
endmodule
