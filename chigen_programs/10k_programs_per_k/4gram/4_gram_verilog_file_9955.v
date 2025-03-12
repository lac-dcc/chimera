// Seed: 1452889602
module module_0 (
    input  tri   id_0,
    output uwire id_1
);
  wire id_3;
endmodule
module module_0 #(
    parameter id_2 = 32'd83,
    parameter id_5 = 32'd55
) (
    input tri id_0,
    output logic id_1,
    input wand _id_2,
    inout logic id_3,
    input supply1 id_4,
    input wire _id_5,
    output tri0 id_6,
    input supply1 id_7,
    input wor id_8,
    inout logic id_9,
    input wire id_10,
    input wire module_1,
    input supply1 id_12
);
  bit [-1 : id_5] id_14;
  assign id_9 = -1;
  always @(negedge id_2 < id_10 or posedge id_2) begin : LABEL_0
    id_3 <= id_11 || -1 || -1'b0;
    id_1 = 1;
    assert (-1)
    else;
    #1;
    id_9 <= id_3;
    id_14 = 1;
  end
  wire [id_2  | "" : -1 'h0] id_15;
  wire id_16;
  ;
  wire id_17;
  parameter id_18 = 1;
  assign id_14 = id_8;
  wire id_19;
  wire [1 : 1] id_20;
  xnor primCall (
      id_6,
      id_21,
      id_22,
      id_7,
      id_12,
      id_8,
      id_18,
      id_17,
      id_4,
      id_3,
      id_16,
      id_19,
      id_0,
      id_14,
      id_9
  );
  wire id_21;
  parameter id_22 = -1;
  module_0 modCall_1 (
      id_0,
      id_6
  );
  assign modCall_1.id_1 = 0;
  always @(*) id_1 = 1;
endmodule
