// Seed: 1402933384
module module_0 #(
    parameter id_5 = 32'd25
) (
    id_1,
    id_2,
    id_3
);
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  assign id_4 = 1'b0;
  logic _id_5;
  ;
  wire id_6;
  assign id_1 = id_5;
  assign id_3[-1] = -1;
  always @(1 or posedge !id_5) begin : LABEL_0
    assign id_4 = id_3 != "" - id_3 - 1;
    fork
      assign id_5[1 : id_5] = id_4;
    join
  end
endmodule
module module_1 (
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
    id_19
);
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  module_0 modCall_1 (
      id_2,
      id_19,
      id_10
  );
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout logic [7:0] id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_10[-1] = 1;
endmodule
