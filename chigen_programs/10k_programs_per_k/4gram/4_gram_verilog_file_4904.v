// Seed: 4050673318
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
    id_12
);
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  assign module_1.id_0 = 0;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13;
  ;
  wire id_14;
endmodule
module module_1 #(
    parameter id_0 = 32'd34,
    parameter id_5 = 32'd91,
    parameter id_8 = 32'd75
) (
    input wire _id_0,
    input uwire id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    output wire _id_5,
    input wand id_6,
    output tri0 id_7,
    input tri _id_8
);
  genvar id_10;
  struct packed {
    logic [-1 'b0 : id_5  -  id_8] id_11;
    id_12 id_13;
  } [1 : 1] id_14;
  uwire [1 : id_0] id_15 = 1;
  assign id_14.id_12 = id_8;
  parameter id_16 = $unsigned(97);
  ;
  tri id_17 = -1;
  always
    if (1) begin : LABEL_0
      id_14 <= {1, 1};
    end
  module_0 modCall_1 (
      id_17,
      id_15,
      id_17,
      id_17,
      id_17,
      id_17,
      id_15,
      id_17,
      id_10,
      id_10,
      id_10,
      id_15
  );
  assign id_14.id_13[-1] = id_14.id_12;
endmodule
