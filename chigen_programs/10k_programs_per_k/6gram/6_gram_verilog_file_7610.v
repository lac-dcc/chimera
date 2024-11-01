// Seed: 1839431158
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_4(
      id_3
  ); module_0();
  initial
  fork : id_5
  join : id_6
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
  assign id_3 = id_4;
  module_0();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_5;
  module_0();
  assign id_5 = 1'd0;
  id_6(
      .id_0(id_3), .id_1(id_3), .id_2(id_5), .id_3(id_5), .id_4(id_3 ^ 1)
  );
endmodule
