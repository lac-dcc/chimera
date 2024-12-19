// Seed: 871731617
module module_0 ();
  wand id_1;
  for (id_2 = 1; 1; id_1++) begin : LABEL_0
    wire id_3;
  end
  module_2 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.type_6 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_3 != 1;
  wire id_4;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5 = 1;
endmodule
