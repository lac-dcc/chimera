// Seed: 1065272098
module module_0 #(
    parameter id_27 = 32'd68,
    parameter id_28 = 32'd8
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
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  input wire id_22;
  output wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_24;
  if (1 == id_2) wire id_25 = id_23;
  else begin
    wire id_26;
    defparam id_27.id_28 = id_28;
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
    id_8
);
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_9;
  generate
    always @(posedge 1) begin
      id_8 = 1;
      id_4 <= id_9;
      id_3 <= id_4;
    end
  endgenerate
  module_0(
      id_1,
      id_7,
      id_2,
      id_1,
      id_5,
      id_6,
      id_7,
      id_7,
      id_8,
      id_1,
      id_7,
      id_8,
      id_8,
      id_7,
      id_8,
      id_1,
      id_8,
      id_7,
      id_8,
      id_6,
      id_8,
      id_5,
      id_7
  );
  wire id_10;
  always @(1 or posedge id_9) begin
    id_7 = 1 * id_1;
  end
endmodule
