// Seed: 2086369154
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
    id_28
);
  inout wire id_28;
  input wire id_27;
  output wire id_26;
  output supply1 id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_25 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd4,
    parameter id_6  = 32'd28
) (
    output logic id_0,
    input supply1 id_1,
    output supply1 id_2,
    output tri id_3,
    input wand id_4,
    input uwire id_5,
    input uwire _id_6,
    input wire id_7,
    input wand id_8,
    output tri id_9,
    input uwire _id_10
);
  wire id_12;
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12
  );
  assign id_2 = id_8;
  always @(posedge -1 ^ id_6) begin : LABEL_0
    id_0 <= #id_8 id_12;
    assign id_0 = 1;
  end
  uwire [id_10  *  1 'b0 : id_6] id_13;
  assign id_2 = id_13;
  id_14 :
  assert property (@(negedge id_6) id_14)
  else $clog2(87);
  ;
  assign id_13 = 1;
endmodule
