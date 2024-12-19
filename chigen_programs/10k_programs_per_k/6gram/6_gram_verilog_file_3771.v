// Seed: 2787266529
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(*) begin : LABEL_0
    id_5 = id_3;
    if (1) id_1 <= 1'b0;
    else begin : LABEL_0
      id_5 = #1 1;
    end
  end
endmodule
module module_1 #(
    parameter id_8 = 32'd32,
    parameter id_9 = 32'd60
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  logic [7:0] id_6;
  generate
    genvar id_7;
    if (id_4) begin : LABEL_0
      defparam id_8.id_9 = 1;
      genvar id_10;
      always @(*) force id_8 = id_2;
    end else begin : LABEL_0
      assign id_6[1&1] = 1;
    end
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_10,
      id_2
  );
endmodule
