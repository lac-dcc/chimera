// Seed: 3581563613
module module_0 ();
  wor id_1 = 1;
  wor id_2;
  specify
    (id_3 => id_4) = (id_2 & 1, id_1);
    (id_5 => id_6) = 1;
    specparam id_7 = 1;
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(id_3 != (id_3)) begin : LABEL_0
    id_6 += 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
endmodule
