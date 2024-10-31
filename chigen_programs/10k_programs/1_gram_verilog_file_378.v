// Seed: 1007115732
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  wire id_4;
  module_2();
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  module_0(
      id_3, id_3, id_4
  );
endmodule
module module_2;
  always id_1 <= ~1;
endmodule
module module_3;
  assign id_1 = 1;
  module_2();
endmodule
