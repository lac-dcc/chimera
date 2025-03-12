// Seed: 596165153
module module_0;
  generate
    for (id_1 = 1; id_1 + -1 - -1; id_1 = 1'b0) begin : LABEL_0
      wire id_2;
      ;
    end
  endgenerate
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout uwire id_2;
  output wire id_1;
  assign id_2 = 1'b0;
  wire id_4;
  module_0 modCall_1 ();
  specify
    (id_5 => id_6) = (1 == id_3  : id_4  : -1, 1  : id_2  : -1);
    (id_7 => id_8) = 1;
  endspecify
endmodule
