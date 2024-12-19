// Seed: 1331072768
module module_0 (
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
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_27 = 32'd34,
    parameter id_28 = 32'd19,
    parameter id_29 = 32'd15,
    parameter id_30 = 32'd35
) (
    input tri id_0
    , id_25,
    output uwire id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    input tri id_5,
    input wand id_6
    , id_26,
    input wire id_7,
    output uwire id_8,
    input supply1 id_9,
    input tri id_10,
    input supply1 id_11,
    output supply1 id_12,
    input tri0 id_13,
    input tri1 id_14,
    output wand id_15,
    input wire id_16,
    input supply0 id_17,
    output wand id_18,
    input tri0 id_19,
    output uwire id_20,
    output supply0 id_21,
    input wor id_22,
    output wand id_23
);
  nor primCall (
      id_1,
      id_5,
      id_10,
      id_0,
      id_3,
      id_22,
      id_25,
      id_7,
      id_4,
      id_2,
      id_19,
      id_13,
      id_14,
      id_11,
      id_9,
      id_16,
      id_17
  );
  module_0 modCall_1 (
      id_25,
      id_26,
      id_26,
      id_25,
      id_26,
      id_25,
      id_25,
      id_25,
      id_26,
      id_25,
      id_25,
      id_25,
      id_26,
      id_25,
      id_26,
      id_26,
      id_25,
      id_26,
      id_26
  );
  generate
    if (id_7) begin : LABEL_0
      defparam id_27.id_28 = 1; defparam id_29.id_30 = id_19 ~^ 1;
    end else begin : LABEL_0
      assign id_18 = 1;
      assign id_8  = id_19;
    end
  endgenerate
endmodule
