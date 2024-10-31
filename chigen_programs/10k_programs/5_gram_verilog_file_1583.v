// Seed: 2531585317
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  wire id_5;
  wire id_6;
  assign id_3 = id_4 == (1'd0);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  module_0(
      id_4, id_3, id_5, id_5
  ); id_6(
      .id_0(1), .id_1(1), .id_2(~id_1), .id_3(id_3 == id_5), .id_4(1)
  );
endmodule
