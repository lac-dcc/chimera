// Seed: 3540063604
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output tri id_6,
    output wire id_7,
    input uwire id_8,
    output tri0 id_9,
    output tri0 id_10
);
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1
);
  wire id_3;
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
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
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout supply1 id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_11 = -1;
  logic \id_18 = id_4 - 1;
endmodule
module module_0 #(
    parameter id_1 = 32'd2
) (
    module_3,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  inout wire id_2;
  inout wire _id_1;
  wire id_11;
  assign id_7[-1] = id_1 != -1'b0 - ~id_3;
  logic [id_1 : -1] id_12, id_13;
  wire id_14;
  assign id_8 = id_1;
  assign id_5 = id_3[1];
  logic [-1  +  -1 : -1 'b0] id_15;
  module_2 modCall_1 (
      id_2,
      id_14,
      id_6,
      id_14,
      id_5,
      id_2,
      id_15,
      id_15,
      id_4,
      id_2,
      id_14,
      id_2,
      id_2,
      id_15,
      id_10,
      id_14,
      id_6
  );
  always @(id_10 or posedge -1) begin : LABEL_0
    id_13 <= "";
  end
endmodule
