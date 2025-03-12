// Seed: 2512885245
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
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30
);
  output wire id_30;
  output wire id_29;
  output wire id_28;
  output wire id_27;
  inout wire id_26;
  input wire id_25;
  assign module_1._id_6 = 0;
  output wire id_24;
  output wire id_23;
  inout wire id_22;
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_31 = id_26;
  assign id_27 = id_17;
endmodule
module module_1 #(
    parameter id_12 = 32'd90,
    parameter id_14 = 32'd99,
    parameter id_15 = 32'd72,
    parameter id_20 = 32'd25,
    parameter id_3  = 32'd44,
    parameter id_4  = 32'd90,
    parameter id_6  = 32'd5
) (
    output tri1 id_0,
    output tri0 id_1,
    output wand id_2,
    output tri1 _id_3,
    input wor _id_4,
    output wire id_5,
    input uwire _id_6,
    input supply0 id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wand id_10,
    output uwire id_11,
    input tri0 _id_12
);
  localparam id_14 = -1;
  wire [-1 : id_6] _id_15;
  wire id_16;
  wire [1 : id_12] id_17;
  wire id_18;
  module_0 modCall_1 (
      id_16,
      id_17,
      id_17,
      id_17,
      id_16,
      id_18,
      id_18,
      id_16,
      id_18,
      id_17,
      id_16,
      id_16,
      id_16,
      id_16,
      id_18,
      id_18,
      id_16,
      id_18,
      id_16,
      id_16,
      id_16,
      id_16,
      id_18,
      id_18,
      id_16,
      id_17,
      id_17,
      id_16,
      id_16,
      id_18
  );
  parameter id_19 = 1;
  parameter id_20 = id_19;
  logic id_21[id_15  *  id_4  +  id_3 : -1];
  if (-1) begin : LABEL_0
    tri0 id_22;
    assign id_22 = 'b0;
  end else begin : LABEL_1
    defparam id_14.id_20 = -1'b0;
    wire id_23;
    ;
    assign id_0 = id_15;
  end
endmodule
