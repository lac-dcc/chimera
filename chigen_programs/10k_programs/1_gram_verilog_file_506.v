// Seed: 1801212642
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(.id_7(1)),
    id_8,
    id_9,
    id_10
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = 1;
  wire id_11 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_2, id_1, id_5, id_4
  );
  wire id_6;
  xnor (id_4, id_1, id_5);
  wire id_7;
endmodule
