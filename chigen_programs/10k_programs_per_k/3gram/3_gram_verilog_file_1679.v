// Seed: 1194895490
module module_0 (
    output uwire id_0,
    input  wor   id_1,
    input  wor   id_2
);
  assign id_0 = id_2;
endmodule
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    output wand  id_2,
    input  wire  id_3,
    input  wor   id_4,
    input  wor   id_5,
    input  tri0  id_6,
    input  tri   id_7,
    output logic id_8,
    output uwire id_9,
    output tri0  id_10,
    input  tri1  id_11
);
  initial id_8 = id_5;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2;
  logic id_1;
  always @(posedge id_1) begin : LABEL_0
    if (-1) id_1 <= 1 | 1;
  end
endmodule
module module_3 #(
    parameter id_13 = 32'd18,
    parameter id_16 = 32'd55
) (
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
    _id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    id_18,
    id_19,
    id_20,
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
    id_37,
    id_38,
    id_39
);
  inout wire id_39;
  output wire id_38;
  output wire id_37;
  output wire id_36;
  output wire id_35;
  output wire id_34;
  output wire id_33;
  output wire id_32;
  inout wire id_31;
  input wire id_30;
  input wire id_29;
  input wire id_28;
  input wire id_27;
  input wire id_26;
  output tri id_25;
  input wire id_24;
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout logic [7:0] id_18;
  input wire id_17;
  inout wire _id_16;
  input wire id_15;
  input wire id_14;
  input wire _id_13;
  inout wire id_12;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_40;
  logic id_41;
  assign id_18[-1] = id_3;
  generate
    assign id_25 = 1;
    assign id_25 = -1;
    if (1 / 1) begin : LABEL_0
      logic [1 : (  id_13  )] id_42 = id_3[1];
      assign id_42 = -1 - id_12;
      if (-1) begin : LABEL_1
        wire id_43;
      end
    end else begin : LABEL_2
      wire [-1 : id_16] id_44;
    end
  endgenerate
  always #1;
  integer [id_16 : 1] id_45;
  ;
endmodule
