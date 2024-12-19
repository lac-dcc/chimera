// Seed: 488754670
module module_0 #(
    parameter id_23 = 32'd21,
    parameter id_24 = 32'd37
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_22(
      .id_0(1'd0), .id_1(id_5), .id_2(id_14), .id_3(1), .id_4(id_1), .id_5(1)
  );
  always @* id_1 = id_20;
  assign id_11 = id_17;
  generate
    always @(posedge 1) begin : LABEL_0
    end
    defparam id_23.id_24 = 1'b0;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  logic [7:0] id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_4,
      id_1,
      id_3,
      id_3,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
  assign modCall_1.id_24 = 0;
  generate
    assign id_13[1] = 1;
  endgenerate
endmodule
