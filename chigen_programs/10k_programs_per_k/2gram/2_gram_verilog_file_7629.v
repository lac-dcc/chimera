// Seed: 521817774
module module_0 #(
    parameter id_3 = 32'd15,
    parameter id_4 = 32'd93
) (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  defparam id_3.id_4 = id_4;
endmodule
module module_1 #(
    parameter id_4 = 32'd87,
    parameter id_5 = 32'd88
) (
    id_1
);
  output wire id_1;
  wand id_2 = 1'b0;
  tri  id_3;
  generate
    always begin : LABEL_0
      id_1 <= 1 === id_2;
    end
  endgenerate
  assign id_1 = 1;
  generate
    defparam id_4.id_5 = id_5;
  endgenerate
  wand id_6 = 1;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  assign modCall_1.id_4 = 0;
  initial
    #1 begin : LABEL_0
      id_3 = 1;
    end
  wire id_7;
endmodule
