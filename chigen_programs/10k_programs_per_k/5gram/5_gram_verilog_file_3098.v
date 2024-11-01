// Seed: 3693969140
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3[1] = 1'h0;
  buf (id_1, id_2);
  module_0(
      id_2, id_2, id_2, id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  xnor (id_2, id_4, id_6, id_5, id_1, id_3);
  tri id_6 = 1 == id_6;
  module_0(
      id_3, id_1, id_3, id_2
  );
endmodule
