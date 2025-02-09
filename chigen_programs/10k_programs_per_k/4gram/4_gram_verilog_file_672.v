// Seed: 399373656
module module_0 (
    output wire  id_0,
    output uwire id_1
);
  assign id_1 = id_3;
  assign module_1.type_16 = 0;
endmodule
module module_1 (
    input  wor   id_0,
    output uwire id_1,
    input  tri   id_2,
    input  tri0  id_3,
    output tri   id_4
    , id_8,
    output tri0  id_5,
    input  wand  id_6
);
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_1
  );
  wire id_10;
  wire id_11;
  integer id_12;
  wire id_13;
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
    id_14
);
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wand id_15 = 1;
  wire id_16;
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
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri1 id_18;
  assign id_18 = 1;
  reg id_19 = id_1;
  always @(id_12 or posedge id_14) begin : LABEL_0
    id_9 <= id_19;
    id_17 = id_8;
    for (id_6 = id_13; id_15; id_15 = 1'b0) id_3 <= ~id_15;
  end
  module_2 modCall_1 (
      id_2,
      id_14,
      id_6,
      id_5,
      id_18,
      id_6,
      id_4,
      id_15,
      id_2,
      id_2,
      id_15,
      id_18,
      id_14,
      id_6
  );
endmodule
