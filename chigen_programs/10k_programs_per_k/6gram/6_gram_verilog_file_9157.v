// Seed: 285321549
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1 && 1;
endmodule
module module_1;
  wire id_1, id_2;
  module_0(
      id_2, id_1, id_1, id_2, id_2, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = 1;
  module_0(
      id_2, id_2, id_1, id_2, id_2, id_2
  );
  always force id_2 = id_3;
endmodule
