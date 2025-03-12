// Seed: 3458622450
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_9 = (-1'b0);
  wire id_13 = id_7;
endmodule
module module_1 #(
    parameter id_12 = 32'd80,
    parameter id_16 = 32'd56,
    parameter id_18 = 32'd73,
    parameter id_5  = 32'd62
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    _id_18,
    id_19,
    id_20
);
  output supply0 id_20;
  inout logic [7:0] id_19;
  input wire _id_18;
  inout supply0 id_17;
  inout wire _id_16;
  inout logic [7:0] id_15;
  output wire id_14;
  inout wire id_13;
  inout wire _id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  module_0 modCall_1 (
      id_17,
      id_4,
      id_17,
      id_4,
      id_4,
      id_20,
      id_13,
      id_3,
      id_17,
      id_17,
      id_17,
      id_17
  );
  output supply1 id_8;
  output wire id_7;
  output wire id_6;
  input wire _id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_20 = 1;
  always_ff @(-1'd0 or posedge 1'b0) begin : LABEL_0
    $clog2(86);
    ;
  end
  assign id_8 = 1;
  final $clog2(40);
  ;
  wire id_21;
  pullup (id_1 ? -1 : -1, 1);
  assign id_15[1+id_16] = id_19;
  wire id_22;
  wire [id_5 : id_18  ==  id_12] id_23;
  logic id_24;
  ;
  assign id_17 = -1 - 1'b0;
  always_comb  @  (  id_11  or  posedge  id_3  or  posedge  -1  or  posedge  1  ,  id_22  or  posedge  1  or  posedge  -1  ,  posedge  id_15  or  posedge  id_19  [  -1  ]  or  posedge  id_3  )  ;
endmodule
