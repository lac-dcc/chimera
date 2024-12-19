// Seed: 2433619215
module module_0;
  wire  id_2;
  uwire id_3 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always begin : LABEL_0
    if (id_3 ^ id_5)
      if (id_2) id_4 <= id_6;
      else;
    begin : LABEL_0
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.type_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  always id_6 = 1'b0;
endmodule
