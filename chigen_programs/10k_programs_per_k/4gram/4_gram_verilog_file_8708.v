// Seed: 4290263670
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
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_24;
endmodule
module module_1 #(
    parameter id_20 = 32'd40,
    parameter id_5  = 32'd42
) (
    input tri1 id_0,
    input wire id_1,
    output uwire id_2,
    output tri0 id_3,
    input tri1 id_4,
    input tri _id_5,
    input tri id_6,
    input supply1 id_7
    , id_19,
    input tri id_8,
    input uwire id_9,
    input uwire id_10,
    input wor id_11,
    output uwire id_12,
    input tri1 id_13,
    input tri0 id_14,
    output tri0 id_15,
    input supply1 id_16,
    input tri0 id_17
);
  parameter id_20 = "";
  wire id_21;
  wire [-1 : id_20] id_22;
  wire id_23;
  ;
  logic [7:0] id_24;
  wire id_25;
  logic [-1 : -1] id_26;
  module_0 modCall_1 (
      id_21,
      id_21,
      id_26,
      id_22,
      id_23,
      id_25,
      id_26,
      id_23,
      id_26,
      id_22,
      id_26,
      id_22,
      id_21,
      id_25,
      id_23,
      id_22,
      id_25,
      id_26,
      id_25,
      id_25,
      id_26,
      id_25,
      id_22
  );
  assign id_21 = (id_1);
  always_latch @(id_5 == id_8 or negedge -1'h0) begin : LABEL_0
    assert (id_12++);
  end
endmodule
