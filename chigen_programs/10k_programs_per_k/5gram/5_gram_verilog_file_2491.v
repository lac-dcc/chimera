// Seed: 2781208267
module module_0 (
    input tri1 id_0,
    output wire id_1,
    input wor id_2
    , id_7,
    input supply0 id_3,
    output wand id_4,
    input wand id_5
);
  wire id_8;
endmodule
module module_1 #(
    parameter id_10 = 32'd10,
    parameter id_7  = 32'd42,
    parameter id_8  = 32'd87,
    parameter id_9  = 32'd6
) (
    output tri id_0,
    input tri1 id_1,
    input supply0 id_2,
    input wand id_3,
    output uwire id_4,
    input logic id_5
);
  generate
    initial $display(1);
    if ((id_5) > id_3) begin : LABEL_0
      defparam id_7.id_8 = 1; defparam id_9.id_10 = id_5 == id_1;
      genvar id_11;
      assign id_10 = id_10;
    end
  endgenerate
  logic id_12 = id_5, id_13;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_1,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.type_11 = 0;
  wor id_14 = id_3;
  initial begin : LABEL_0
    id_13 <= 1;
  end
endmodule
