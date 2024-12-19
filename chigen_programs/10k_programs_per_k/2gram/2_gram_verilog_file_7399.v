// Seed: 3708904077
module module_0 (
    output tri1  id_0,
    output tri   id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  uwire id_4
);
  assign id_0 = id_4;
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input tri id_2
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_4 = 0;
  wire id_4;
  wire id_5;
  generate
    wire id_6;
  endgenerate
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
    id_13
);
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_14;
  wire id_15;
  assign module_3.id_2 = 0;
  id_16(
      .id_0(id_15), .id_1(1'b0), .id_2(1)
  );
endmodule
module module_3 (
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
    id_15
);
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1'h0;
  module_2 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_14,
      id_9,
      id_2,
      id_7,
      id_5,
      id_10,
      id_5,
      id_9,
      id_7,
      id_7
  );
endmodule
