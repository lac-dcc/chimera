// Seed: 236488347
module module_0 #(
    parameter id_4 = 32'd27,
    parameter id_5 = 32'd50
) (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_3;
  defparam id_4.id_5 = id_4;
  wire id_6;
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
    id_17
);
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_18;
  module_0 modCall_1 (
      id_7,
      id_17,
      id_18
  );
  assign modCall_1.id_5 = 0;
  always_ff @(1'b0, posedge 1) begin : LABEL_0
    fork
      id_3 <= 1;
    join
  end
  wire id_19;
  assign id_5 = 1;
  wire id_20 = id_14;
  integer id_21 (
      id_3,
      (1'd0) - id_5
  );
endmodule
