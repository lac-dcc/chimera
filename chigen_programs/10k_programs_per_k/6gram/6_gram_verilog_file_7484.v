// Seed: 3070181540
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  tri1 id_6, id_7, id_8, id_9;
  wire id_10;
  wire id_11;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4,
      id_4
  );
  assign id_3 = id_1 ? id_4 : 1 ? 1'b0 : id_1 ? 1 : 1;
endmodule
