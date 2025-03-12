// Seed: 3404942098
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    module_0
);
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output supply0 id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_5 - -1'b0 ? -1 : -1;
  logic [-1 : -1] id_10;
endmodule
module module_1 #(
    parameter id_24 = 32'd0,
    parameter id_7  = 32'd15
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
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
    _id_24
);
  inout wire _id_24;
  inout logic [7:0] id_23;
  input wire id_22;
  inout supply1 id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  inout logic [7:0] id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  and primCall (
      id_18,
      id_13,
      id_11,
      id_1,
      id_23,
      id_5,
      id_12,
      id_21,
      id_10,
      id_14,
      id_17,
      id_3,
      id_9,
      id_15,
      id_22
  );
  module_0 modCall_1 (
      id_9,
      id_2,
      id_20,
      id_2,
      id_9,
      id_2,
      id_3,
      id_12,
      id_13
  );
  assign modCall_1.id_4 = 0;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire _id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_21 = 1'd0;
  logic id_25;
  initial begin : LABEL_0
    assign id_23 = -1'b0;
    id_23[1 :-1] = id_17[id_24 : id_7>-1'b0+-1'h0] == id_15;
  end
endmodule
