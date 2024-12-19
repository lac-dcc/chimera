// Seed: 3464235392
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(.id_7(1))
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
  wire id_10;
  wire id_11;
  module_2 modCall_1 (
      id_2,
      id_3
  );
  assign modCall_1.id_1 = 0;
  wire id_12;
endmodule
module module_1;
  wand id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign id_1 = id_2 & 1;
  wire id_3;
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  always id_1 = 1'b0;
  assign id_2 = 1;
  wire id_3;
  wire id_4, id_5;
endmodule
