// Seed: 2095799560
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = 1;
  and primCall (id_1, id_3, id_4, id_5);
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
  nor primCall (id_3, id_4, id_2);
endmodule
module module_2;
  wire id_1, id_3;
  assign id_1 = id_3;
  assign module_0.id_3 = 0;
endmodule
