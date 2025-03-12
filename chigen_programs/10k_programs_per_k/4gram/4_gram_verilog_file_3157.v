// Seed: 3106393187
module module_0 #(
    parameter id_8 = 32'd2,
    parameter id_9 = 32'd68
) (
    id_1,
    module_0,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  wire _id_8;
  wire [-1 : -1] _id_9;
  wire [id_9 : id_8] id_10;
  generate
    wire id_11;
  endgenerate
endmodule
module module_1 #(
    parameter id_5 = 32'd45
) (
    input tri0 id_0,
    input supply1 id_1,
    output wand id_2,
    input wor id_3,
    input wor id_4,
    input supply1 _id_5,
    output wor id_6
);
  tri0 id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  assign id_2 = -1;
  if (1) begin : LABEL_0
    assign id_8 = id_0;
  end
  parameter id_9 = 1 / -1'b0;
  logic id_10;
  xnor primCall (id_2, id_1, id_8, id_4);
  assign id_8 = 1'b0;
  assign id_10[id_5] = id_4;
endmodule
