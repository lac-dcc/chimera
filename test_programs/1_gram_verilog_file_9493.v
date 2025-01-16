// Seed: 4115329992
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  wire id_4, id_5;
  assign module_2.id_2 = 0;
endmodule
module module_1 ();
  assign id_1 = id_1 + 'b0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2
  );
  assign id_2 = 1;
endmodule
module module_3 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1
  );
  assign id_1 = 1'b0;
endmodule
