// Seed: 119243092
module module_0 #(
    parameter id_10 = 32'd82,
    parameter id_11 = 32'd30,
    parameter id_12 = 32'd62,
    parameter id_5  = 32'd23,
    parameter id_6  = 32'd67,
    parameter id_7  = 32'd35,
    parameter id_8  = 32'd29,
    parameter id_9  = 32'd2
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  if (id_4) begin : LABEL_0
    defparam id_5.id_6#(
        .id_7 (1),
        .id_8 (1),
        .id_9 (id_5),
        .id_10(1),
        .id_11(1),
        .id_12(1)
    ) = id_11;
  end else begin : LABEL_0
    wire id_13;
  end
  wire id_14;
  assign id_2 = 1;
  wire id_15;
  assign id_1 = id_15;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
endmodule
