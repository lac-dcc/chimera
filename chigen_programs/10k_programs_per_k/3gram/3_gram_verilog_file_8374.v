// Seed: 2892874381
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  supply1 id_5 = 1;
endmodule
module module_1 #(
    parameter id_13 = 32'd95
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
    id_14
);
  input wire id_14;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_5
  );
  inout wire _id_13;
  input wire id_12;
  nor primCall (id_5, id_3, id_7, id_14, id_12, id_6, id_8, id_11, id_2, id_1);
  input wire id_11;
  output wire id_10;
  output tri0 id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  tri [1 : id_13] id_15;
  wire id_16;
  wire id_17;
  parameter id_18 = 1;
  if (1) begin : LABEL_0
    assign id_15 = -1;
    assign id_4  = id_11#(.id_2(""));
  end
  assign id_9  = id_3 - id_15;
  assign id_16 = id_8#(.id_17(1));
  wire [id_13 : ~  1] id_19;
  localparam id_20 = id_18 * id_18;
endmodule
