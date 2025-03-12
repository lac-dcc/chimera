// Seed: 347246381
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wand id_4;
  assign id_4 = id_1 ? 1'b0 : id_1#(.id_2(-1)) | -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7
  );
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8 = -1;
endmodule
