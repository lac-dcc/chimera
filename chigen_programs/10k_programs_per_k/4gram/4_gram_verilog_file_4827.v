// Seed: 567684701
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
    id_27
);
  input wire id_27;
  inout wire id_26;
  input wire id_25;
  output wire id_24;
  input wire id_23;
  input wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_28 = id_21;
endmodule
module module_1 #(
    parameter id_0 = 32'd28,
    parameter id_2 = 32'd71,
    parameter id_3 = 32'd32,
    parameter id_4 = 32'd29
) (
    output wire _id_0,
    input  wire id_1,
    output wand _id_2,
    output tri0 _id_3,
    input  tri0 _id_4,
    input  tri1 id_5
);
  wire id_7;
  struct packed {
    logic [id_3 : 1] id_8;
    struct packed {
      logic [1 : id_2] id_9;
      logic [1 : id_4] id_10;
    } [id_4 : 1] id_11;
  } [1 : id_0] id_12;
  always @(posedge "" or posedge id_7) begin : LABEL_0
    id_12.id_8 <= 1'h0;
  end
  module_0 modCall_1 (
      id_11,
      id_7,
      id_7,
      id_10,
      id_8,
      id_8,
      id_7,
      id_8,
      id_12,
      id_12,
      id_12,
      id_9,
      id_7,
      id_12,
      id_11,
      id_11,
      id_12,
      id_9,
      id_12,
      id_8,
      id_8,
      id_12,
      id_10,
      id_9,
      id_9,
      id_9,
      id_7
  );
  assign id_12.id_10[1] = 1;
  assign id_7 = id_12.id_10;
  logic id_13;
  ;
endmodule
