// Seed: 1998425145
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
    id_17
);
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output reg id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_18;
  always_ff @(posedge 1) id_13 = 1;
  logic id_19;
  ;
  always_comb #(id_1) $signed(29);
  ;
  assign id_11 = id_16;
endmodule
module module_1 #(
    parameter id_2 = 32'd39,
    parameter id_3 = 32'd95
) (
    output tri0  id_0,
    output logic id_1,
    input  tri   _id_2,
    input  uwire _id_3,
    output tri   id_4
);
  wire [id_3 : 1  >>  id_2] id_6;
  parameter integer id_7 = 1;
  logic id_8;
  logic id_9;
  ;
  initial begin : LABEL_0
    if (id_7)
      if (id_7) begin : LABEL_1
        id_1 <= id_2;
      end else begin : LABEL_2
        disable id_10;
      end
    else id_9 = id_9 !== 1;
  end
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_7,
      id_7,
      id_7,
      id_8,
      id_6,
      id_7,
      id_8,
      id_8,
      id_7,
      id_6,
      id_7,
      id_9,
      id_8,
      id_11,
      id_11,
      id_7
  );
endmodule
