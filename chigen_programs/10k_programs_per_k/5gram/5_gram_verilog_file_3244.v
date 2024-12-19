// Seed: 2397963576
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  wire id_4;
  always @(posedge id_2 or 1) id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  assign id_1 = id_2 != "";
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5
  );
  assign modCall_1.id_3 = 0;
  assign id_2[1] = 1;
endmodule
