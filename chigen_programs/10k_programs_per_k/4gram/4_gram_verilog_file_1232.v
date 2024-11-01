// Seed: 3505636087
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_6(
      .id_0(1),
      .id_1(1'h0),
      .id_2(id_2),
      .id_3(),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(1 > id_1++),
      .id_8(id_1),
      .id_9(id_1),
      .id_10(1)
  );
  assign id_5 = 1;
  id_7 :
  assert property (@(negedge !id_1) id_1)
  else $display;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  or (id_4, id_1, id_5);
  module_0(
      id_1, id_1, id_5, id_4, id_4
  );
endmodule
