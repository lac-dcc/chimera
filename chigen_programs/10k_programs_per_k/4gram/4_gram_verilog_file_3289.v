// Seed: 1644886020
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wor id_2,
    input wor module_0,
    output supply1 id_4,
    input tri0 id_5,
    input wor id_6
);
  wire id_8;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    input wor id_2,
    input supply1 id_3,
    input wand id_4,
    output wire id_5,
    output uwire id_6
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_5,
      id_0,
      id_1
  );
  assign modCall_1.id_5 = 0;
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
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  assign module_3.id_7 = 0;
  output logic [7:0] id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic [1 : 1 'b0] id_14, id_15, id_16 = id_9;
  generate
    assign id_7[(-1'b0)] = -1;
  endgenerate
endmodule
module module_3 #(
    parameter id_2 = 32'd37,
    parameter id_7 = 32'd96
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7
);
  input wire _id_7;
  output logic [7:0] id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire _id_2;
  input wire id_1;
  assign id_6[id_2] = id_3;
  assign id_6 = id_2;
  wire [1 : id_7] id_8;
  module_2 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_3,
      id_8,
      id_3,
      id_6,
      id_8,
      id_3,
      id_8,
      id_8,
      id_5,
      id_4
  );
  logic id_9;
endmodule
