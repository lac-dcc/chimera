// Seed: 506471150
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  wire id_6;
  assign id_3 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  pmos (1'b0, id_1, (id_2#(.id_3 (1))), 1'h0, id_5);
  bufif0 primCall (id_5, id_3, id_2);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3
  );
  wire id_6;
endmodule
