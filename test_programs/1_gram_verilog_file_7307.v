// Seed: 3142959702
module module_0 #(
    parameter id_16 = 32'd97
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_14, id_15;
  assign id_12 = id_7;
  defparam id_16 = -1;
  wire id_17, id_18;
  wire id_19;
  assign id_1 = 1'b0;
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
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wand id_20;
  always
    if (id_9) begin : LABEL_0
      @(posedge 1 or posedge id_20) @(*) id_3 <= 1;
    end
  assign id_15 = "";
  module_0 modCall_1 (
      id_20,
      id_12,
      id_20,
      id_4,
      id_19,
      id_6,
      id_6,
      id_12,
      id_20,
      id_18,
      id_13,
      id_12,
      id_18
  );
endmodule
