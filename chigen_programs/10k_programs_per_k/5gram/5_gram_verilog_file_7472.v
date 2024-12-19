// Seed: 3563222378
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
    id_11
);
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
  wire id_13;
endmodule
module module_1 #(
    parameter id_24 = 32'd66,
    parameter id_25 = 32'd6
) (
    output supply1 id_0,
    input wire id_1,
    output uwire id_2,
    input supply0 id_3,
    output uwire id_4,
    output tri0 id_5,
    input tri0 id_6,
    input wire id_7,
    input uwire id_8,
    input uwire id_9,
    output wor id_10,
    input tri id_11,
    input wand id_12,
    input tri1 id_13,
    inout wor id_14,
    output tri1 id_15
    , id_23,
    output wire id_16,
    input wor id_17,
    input wand module_1,
    input tri id_19,
    output wor id_20,
    output uwire id_21
);
  defparam id_24.id_25 = 1;
  wire id_26;
  assign id_20 = 1;
  tri id_27 = 1'h0;
  module_0 modCall_1 (
      id_26,
      id_27,
      id_27,
      id_23,
      id_23,
      id_26,
      id_26,
      id_26,
      id_27,
      id_23,
      id_26
  );
  or primCall (
      id_10,
      id_1,
      id_14,
      id_26,
      id_11,
      id_12,
      id_13,
      id_25,
      id_6,
      id_24,
      id_27,
      id_3,
      id_8,
      id_23,
      id_7,
      id_9,
      id_17
  );
  initial begin : LABEL_0
    id_21 = 1'b0;
  end
endmodule
