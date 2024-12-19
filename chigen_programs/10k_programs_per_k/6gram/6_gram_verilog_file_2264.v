// Seed: 3158567965
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_9;
  always @(posedge id_4 or posedge id_5) $display(id_4);
endmodule
module module_1 #(
    parameter id_26 = 32'd64,
    parameter id_27 = 32'd90
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
    id_13,
    id_14
);
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  tri  id_15;
  wire id_16;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_3,
      id_5,
      id_10,
      id_4,
      id_8,
      id_13
  );
  wire id_18;
  reg id_19;
  tri id_20;
  logic [7:0] id_21;
  wire id_22;
  wire id_23;
  wire id_24;
  assign id_15 = 1;
  always @(*) $display;
  generate
    assign id_21[1 : 1'b0] = id_2[1];
    for (id_25 = 1; id_20; id_25 = id_10) begin : LABEL_0
      initial begin : LABEL_0
        id_19 <= 1;
      end
      defparam id_26.id_27 = 1;
    end
  endgenerate
endmodule
