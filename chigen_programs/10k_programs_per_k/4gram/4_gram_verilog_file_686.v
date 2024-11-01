// Seed: 3318334740
module module_0 #(
    parameter id_15 = 32'd22,
    parameter id_16 = 32'd28
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
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    defparam id_15.id_16 = 1;
  endgenerate
endmodule
module module_1 (
    input tri0 id_0,
    input tri id_1,
    input supply1 id_2,
    output logic id_3,
    output tri0 id_4,
    input tri1 id_5,
    output supply0 id_6,
    input wire id_7,
    input wor id_8,
    input wire id_9,
    input wand id_10,
    input tri0 id_11,
    input tri1 id_12,
    input tri id_13,
    input supply1 id_14,
    input tri id_15
    , id_24,
    output tri1 id_16,
    input supply1 id_17,
    output supply0 id_18,
    input wand id_19,
    input tri1 id_20
    , id_25,
    input supply1 id_21,
    output wand id_22
);
  uwire id_26;
  module_0(
      id_25,
      id_24,
      id_26,
      id_25,
      id_26,
      id_25,
      id_25,
      id_25,
      id_26,
      id_24,
      id_25,
      id_25,
      id_26,
      id_25
  );
  initial begin
    id_3 <= 1;
    case (1)
      id_19 - 1'b0: id_24 = id_24;
      id_19: id_26 = 1;
      1: id_22 = 1'b0;
    endcase
  end
  generate
    assign id_16 = id_8 - 1;
  endgenerate
endmodule
