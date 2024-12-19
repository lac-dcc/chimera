// Seed: 3869809095
module module_0;
  assign id_1 = 1'd0;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_1;
  always @* begin : LABEL_0
    id_1 = 1;
    id_1 = id_1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  specify
    (id_2 => id_3) = 1;
    specparam id_4 = id_4;
  endspecify
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
