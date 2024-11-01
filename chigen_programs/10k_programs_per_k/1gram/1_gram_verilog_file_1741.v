// Seed: 542481071
module module_0 (
    id_1
);
  inout wire id_1;
  assign id_1 = {id_1, 1, id_1, 1, 1'b0, (1), 1, -1, 1};
  wire id_2;
  id_3(
      .id_0(id_1), .id_1(1), .id_2(1)
  ); id_4(
      .id_0(1),
      .id_1(1),
      .id_2(1'b0),
      .id_3(1'b0),
      .id_4(1),
      .id_5(1'b0),
      .id_6(id_1),
      .id_7(id_2),
      .id_8(1),
      .id_9(id_5),
      .id_10(id_3),
      .id_11(1'b0)
  );
  wire id_6, id_7;
  wire id_8, id_9;
  wire id_10;
endmodule
module module_1 (
    output logic id_0,
    output wand  id_1,
    input  logic id_2,
    input  wire  id_3
);
  initial id_0 <= id_2;
  assign id_1 = 1;
  wire id_5;
  longint id_6;
  id_7(
      id_5
  );
  nor (id_0, id_5, id_7, id_6, id_2);
  module_0(
      id_5
  );
endmodule
