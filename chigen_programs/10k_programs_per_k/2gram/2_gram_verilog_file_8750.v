// Seed: 117496246
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_7(
      id_4
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_4,
      id_3,
      id_4
  );
endmodule
macromodule module_2 (
    output uwire id_0,
    input  wor   id_1,
    inout  uwire id_2,
    input  uwire id_3
);
  wire id_5;
  wire id_6;
endmodule
module module_3 #(
    parameter id_26 = 32'd53,
    parameter id_27 = 32'd28
) (
    input supply1 id_0,
    input tri id_1,
    input tri0 id_2,
    inout wand id_3,
    input tri1 id_4,
    input wire id_5,
    output wor id_6,
    input wor id_7,
    input supply1 id_8,
    input wand id_9,
    input wor id_10,
    output wor id_11,
    inout uwire id_12
    , id_23,
    input supply1 id_13,
    input tri id_14,
    input tri id_15,
    input wire id_16,
    output tri0 id_17,
    input supply0 id_18,
    output tri id_19,
    output supply1 id_20,
    input tri0 id_21
);
  tri1 id_24;
  tri1 id_25 = 1;
  assign id_3 = id_9;
  if (id_10) begin : LABEL_0
    defparam id_26.id_27 = 1'd0;
  end else begin : LABEL_0
    wire id_28;
  end
  wire id_29;
  wire id_30;
  wire id_31;
  wire id_32;
  wire id_33;
  assign id_12 = id_24;
  module_2 modCall_1 (
      id_6,
      id_3,
      id_12,
      id_15
  );
endmodule
