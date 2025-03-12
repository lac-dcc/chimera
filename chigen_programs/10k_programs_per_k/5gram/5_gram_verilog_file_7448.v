// Seed: 643255475
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
  input wire id_30;
  output wire id_29;
  inout wire id_28;
  input wire id_27;
  inout wire id_26;
  input wire id_25;
  output wire id_24;
  output wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_31;
  wire id_32;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd0,
    parameter id_12 = 32'd45,
    parameter id_22 = 32'd82
) (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    output tri id_5,
    output tri0 id_6,
    input wire id_7,
    input supply0 id_8,
    output supply1 id_9,
    input supply1 _id_10,
    input supply0 id_11
    , id_18,
    input wand _id_12,
    input wor id_13,
    input tri1 id_14,
    output logic id_15,
    input tri id_16
);
  struct packed {
    id_19 id_20;
    logic [-1 : ""] id_21;
  } [1  !=  1 : -1] _id_22;
  ;
  parameter id_23 = -1'h0;
  xnor primCall (
      id_15,
      id_13,
      id_0,
      id_8,
      id_16,
      id_25,
      id_18,
      id_19,
      id_11,
      id_23,
      id_21,
      id_2,
      id_20,
      id_1,
      id_14,
      id_4
  );
  always_comb @(negedge 1 - 1'h0, posedge id_23 == (1)) begin : LABEL_0
    if (1 == 1'b0 && 1'b0 == 1'd0)
      for (integer id_24 = id_1; id_22; id_15 = -1'b0 - 1) begin : LABEL_1
        id_15 = -1;
      end
    else begin : LABEL_2
      id_15 <= id_14 > 1;
    end
  end
  assign {-1'b0 && 1'b0} = id_11;
  wire id_25;
  module_0 modCall_1 (
      id_25,
      id_18,
      id_21,
      id_21,
      id_21,
      id_20,
      id_19,
      id_20,
      id_18,
      id_19,
      id_19,
      id_18,
      id_20,
      id_23,
      id_23,
      id_23,
      id_25,
      id_21,
      id_23,
      id_18,
      id_18,
      id_21,
      id_25,
      id_21,
      id_20,
      id_21,
      id_25,
      id_23,
      id_18,
      id_25
  );
  logic [-1 : id_22] id_26;
  logic id_27, id_28;
  logic [1 : -1 'b0] id_29;
  wire id_30;
  ;
  wire id_31;
endmodule
