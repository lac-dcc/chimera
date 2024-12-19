// Seed: 951411150
module module_0 #(
    parameter id_20 = 32'd35,
    parameter id_21 = 32'd86
) (
    input supply1 id_0,
    output supply1 id_1,
    inout tri id_2,
    output wor id_3,
    input supply0 id_4,
    input tri1 id_5,
    input wand id_6,
    output supply1 id_7,
    input supply0 id_8,
    input wor id_9,
    input wire id_10,
    input wand id_11,
    input tri id_12
);
  wire id_14;
  uwire id_15 = 1'h0, id_16, id_17, id_18, id_19;
  if (~id_16) begin : LABEL_0
    defparam id_20.id_21 = 1;
  end else begin : LABEL_0
    assign id_16 = 1;
  end
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    output wand id_2,
    input wire id_3,
    input tri0 id_4,
    output wor id_5,
    input wire id_6,
    input uwire id_7
);
  uwire id_9 = id_6;
  wire  id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_9,
      id_9,
      id_4,
      id_7,
      id_6,
      id_1,
      id_7,
      id_9,
      id_7,
      id_4,
      id_9
  );
  assign modCall_1.id_21 = 0;
endmodule
