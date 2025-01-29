// Seed: 1371135613
module module_0 (
    input  tri   id_0,
    output wire  id_1,
    output tri   id_2,
    output tri0  id_3,
    input  uwire id_4
);
  assign id_3 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wor  id_0,
    input  wand id_1
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1
  );
endmodule
module automatic module_2 (
    output tri0 id_0,
    input  wire id_1,
    output wire id_2
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
  parameter id_4 = id_4[1'b0];
  not primCall (id_2, id_1);
  wire id_5;
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_10;
  assign id_6 = id_10;
endmodule
module module_4 (
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = id_9;
  tri0 id_12;
  parameter id_13 = id_10;
  assign id_5 = 1;
  module_3 modCall_1 (
      id_12,
      id_5,
      id_5,
      id_5,
      id_12,
      id_13,
      id_11,
      id_13,
      id_11,
      id_8,
      id_5,
      id_11
  );
  wire id_14;
  always begin : LABEL_0
    id_3 = id_5 - -1'h0;
    if (id_12) id_7 <= {1'b0, id_4};
    else id_12 = 1'b0;
    id_2 = {id_14 + -1'b0};
  end
  wire id_15, id_16;
  localparam id_17 = id_6;
  wire id_18;
  wire id_19;
endmodule
