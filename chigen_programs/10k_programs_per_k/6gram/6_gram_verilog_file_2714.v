// Seed: 333944160
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_1 ~^ id_1 ? 1 : 1;
  wand id_4;
  always @* begin : LABEL_0
    id_3 = 1 == id_4;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  uwire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  assign id_3 = id_3 < id_1;
  assign id_1 = id_3 == id_4;
endmodule
