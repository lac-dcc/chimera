// Seed: 3866199084
module module_0 #(
    parameter id_17 = 32'd87,
    parameter id_18 = 32'd88
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
    id_15
);
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  for (id_16 = 1; 1; id_7 = 1) begin
    defparam id_17.id_18 = 1;
  end
  assign id_1 = id_11;
  assign id_4 = 1'b0;
  assign id_1 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    output supply0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input uwire id_5,
    input logic id_6,
    input tri id_7,
    input tri id_8,
    input wor id_9,
    input uwire id_10,
    input wor id_11,
    input uwire id_12,
    output uwire id_13,
    input tri id_14,
    output supply1 id_15,
    input tri id_16,
    output supply0 id_17,
    output tri0 id_18,
    output tri id_19,
    output supply0 id_20,
    output tri0 id_21,
    input wor id_22,
    input wor id_23,
    output supply0 id_24,
    output wand id_25,
    input wand id_26,
    output tri0 id_27
    , id_37, id_38,
    input tri0 id_28,
    input wand id_29,
    input tri1 id_30,
    output tri1 id_31,
    input wor id_32,
    input wand id_33,
    output supply0 id_34,
    output wor id_35
);
  wire id_39;
  wire id_40;
  always id_38 <= #1 id_6;
  xor (
      id_17,
      id_1,
      id_39,
      id_10,
      id_30,
      id_40,
      id_16,
      id_4,
      id_7,
      id_11,
      id_28,
      id_32,
      id_22,
      id_6,
      id_8,
      id_14,
      id_26,
      id_12,
      id_38,
      id_37,
      id_5,
      id_41,
      id_3,
      id_29,
      id_23,
      id_33,
      id_9
  );
  assign id_31 = id_16 - 1;
  wire id_41;
  module_0(
      id_41,
      id_40,
      id_41,
      id_41,
      id_39,
      id_39,
      id_41,
      id_41,
      id_41,
      id_40,
      id_41,
      id_41,
      id_39,
      id_40,
      id_39
  ); id_42(
      .id_0(1'b0)
  );
endmodule
