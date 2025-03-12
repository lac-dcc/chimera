// Seed: 2825385060
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
  output wire id_17;
  input wire id_16;
  inout tri1 id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  assign module_1.id_13 = 0;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_15 = id_10 ? id_6#(
      .id_1 (1),
      .id_10(1),
      .id_10('b0 - -1)
  ) : -1 == id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd63,
    parameter id_5  = 32'd13,
    parameter id_7  = 32'd38
) (
    input wire id_0,
    input wor id_1,
    input tri1 id_2,
    output supply0 id_3,
    input wire id_4,
    input tri0 _id_5,
    input tri1 id_6,
    input wor _id_7
    , id_16,
    input tri0 id_8,
    input tri0 id_9,
    input wire _id_10,
    input uwire id_11,
    output supply1 id_12,
    input wand id_13,
    output wand id_14
);
  parameter id_17 = 1;
  logic [(  id_10  ) : id_5] id_18;
  ;
  wire id_19;
  logic [1 : -1 'b0] id_20;
  ;
  wire id_21;
  logic id_22 = id_21;
  logic id_23 = -1;
  reg [1 : id_7] id_24;
  wire [1 'd0 : -1] id_25;
  logic [1 'd0 : {  1  ,  id_5  }] id_26;
  wire id_27 = ~id_4;
  always @* begin : LABEL_0
    id_22 <= id_24;
  end
  assign id_23 = id_18;
  wire id_28;
  assign id_16 = -1'b0;
  initial begin : LABEL_1
    id_24 = id_7;
    disable id_29;
  end
  module_0 modCall_1 (
      id_20,
      id_16,
      id_27,
      id_20,
      id_21,
      id_19,
      id_21,
      id_19,
      id_28,
      id_25,
      id_27,
      id_25,
      id_28,
      id_28,
      id_23,
      id_23,
      id_19
  );
endmodule
