// Seed: 3082364366
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = -1'h0;
  wire id_4;
  assign module_2.id_2 = 0;
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
  input wire id_1;
  localparam id_5 = -1'b0;
  nor primCall (id_3, id_4, id_1, id_2);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 ();
  assign id_1[1] = 1;
  always id_2 = 1 & -1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
endmodule
