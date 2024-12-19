// Seed: 818574406
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  module_2 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_1;
  wand id_1;
  assign id_1 = 1;
  wire id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  always @(id_1 or posedge 1'b0 + 1) release id_2;
  tri1 id_3;
  assign id_2 = id_3;
endmodule
