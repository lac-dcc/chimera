// Seed: 1280203673
module module_0 #(
    parameter id_20 = 32'd81
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  assign module_1.id_6 = 0;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0]
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
      _id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37;
  logic id_38 = id_36[id_20];
  always @* begin : LABEL_0
    cover (1);
  end
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    output tri0 id_2,
    input tri0 id_3,
    output wand id_4,
    input uwire id_5,
    output wire id_6,
    output wand id_7,
    input tri0 id_8,
    output wire id_9,
    input wor id_10,
    input wor id_11,
    output supply0 id_12
);
  wire id_14;
  wire id_15;
  always @(1'b0);
  assign id_4 = 1'd0 ? id_11 : 1'b0;
  parameter id_16 = 1;
  wire id_17;
  generate
    assign id_1 = id_14;
  endgenerate
  module_0 modCall_1 (
      id_14,
      id_17,
      id_14,
      id_17,
      id_16,
      id_15,
      id_14,
      id_15,
      id_17
  );
endmodule
