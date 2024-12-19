// Seed: 137493842
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  initial id_1 = id_3;
  module_2 modCall_1 (id_2);
  assign id_3 = id_3 + 1'b0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  assign module_3.id_2 = 0;
  assign module_0.id_1 = 0;
endmodule
module module_3;
  assign id_1 = 1;
  tri0 id_2;
  assign id_2 = 1 ? 1 : 1;
  module_2 modCall_1 (id_2);
endmodule
