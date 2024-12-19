// Seed: 2750532112
module module_0;
  tri1 id_1;
  module_2 modCall_1 ();
  specify
    specparam id_2 = id_2 - id_1;
    (id_3 => id_4) = 1;
    (negedge id_5 => (id_6 +: id_2)) = (id_6, 1);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  always @(1 or 1 == 1) begin : LABEL_0
    id_1 <= 1;
    id_3 <= 1'b0;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
module module_2;
  wire id_1;
  assign module_0.id_1 = 0;
endmodule
