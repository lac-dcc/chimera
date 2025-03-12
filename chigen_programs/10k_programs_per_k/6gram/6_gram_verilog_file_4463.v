// Seed: 3900076531
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input wor id_2,
    input tri1 id_3
    , id_15,
    input tri id_4,
    input tri0 id_5,
    output wor id_6,
    input tri id_7,
    output logic id_8,
    output wand id_9,
    input tri id_10,
    input supply1 id_11,
    input supply0 id_12,
    output logic id_13
);
  logic id_16;
  always force id_15 = 1'h0;
  logic id_17;
  ;
  parameter id_18 = 1;
  bit  id_19;
  wire id_20 = ~id_11;
  initial begin : LABEL_0
    id_19 <= "";
    deassign id_13;
    id_8 = -1 == id_5;
    id_13 <= id_2 == id_2;
  end
endmodule
module module_1 #(
    parameter id_0  = 32'd85,
    parameter id_10 = 32'd22,
    parameter id_7  = 32'd99,
    parameter id_8  = 32'd40
) (
    input uwire _id_0,
    output tri1 id_1,
    input tri0 id_2,
    output logic id_3,
    output wire id_4,
    output tri1 id_5,
    output tri0 id_6,
    input tri0 _id_7,
    input supply1 _id_8,
    output tri0 id_9,
    input tri0 _id_10
);
  wire [-1 : (  id_0  ==  id_10  )] id_12;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_2,
      id_3,
      id_1,
      id_2,
      id_2,
      id_2,
      id_3
  );
  always disable id_13;
  logic [1  !=?  id_7 : id_8  -  id_0] id_14;
  ;
  always @(posedge -1'd0 or id_12) id_3 <= 1;
endmodule
