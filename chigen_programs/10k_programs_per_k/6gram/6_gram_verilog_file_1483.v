// Seed: 820732046
module module_0 (
    output wand id_0,
    input  tri1 id_1,
    output tri  id_2
);
endmodule
module module_1 (
    input  tri  id_0,
    output tri1 id_1
);
  wire id_3;
  xnor primCall (id_1, id_6, id_5);
  logic id_4;
  wire  id_5;
  logic id_6;
  ;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1
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
    id_17,
    id_18
);
  output wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    assign id_3 = id_16 == id_16;
    assert (id_3);
  end
endmodule
module module_3 #(
    parameter id_13 = 32'd28,
    parameter id_18 = 32'd46,
    parameter id_20 = 32'd97
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
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire _id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout supply0 id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire _id_18;
  logic id_19;
  logic [-1 : id_13] _id_20 = -1;
  wire [id_20 : id_18] id_21;
  module_2 modCall_1 (
      id_4,
      id_19,
      id_2,
      id_21,
      id_21,
      id_15,
      id_4,
      id_11,
      id_12,
      id_2,
      id_5,
      id_19,
      id_17,
      id_21,
      id_1,
      id_12,
      id_3,
      id_2
  );
  assign id_7 = 1;
endmodule
