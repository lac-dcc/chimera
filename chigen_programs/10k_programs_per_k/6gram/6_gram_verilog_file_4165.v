// Seed: 3948362050
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
    id_13
);
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_9 - id_13;
  wire id_14;
  wire id_15;
  wire id_16;
  wire id_17;
endmodule
module module_1 #(
    parameter id_5 = 32'd34,
    parameter id_6 = 32'd64
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  generate
    for (id_4 = id_4; id_4; id_3 = 1) begin : LABEL_0
      defparam id_5.id_6 = id_6;
      supply1 id_7 = 1'b0;
    end
  endgenerate
  wor id_8 = id_4;
  assign id_3 = id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_4,
      id_7,
      id_7,
      id_8,
      id_7,
      id_4,
      id_4,
      id_4,
      id_8,
      id_7
  );
endmodule
