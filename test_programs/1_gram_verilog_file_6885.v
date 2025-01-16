// Seed: 2535736942
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_1 = -1'b0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  id_3(
      .id_0(id_2),
      .id_1(1),
      .id_2(id_2),
      .id_3(1),
      .id_4($realtime),
      .id_5(id_2),
      .id_6(id_1),
      .id_7(id_1),
      .id_8(1'b0),
      .id_9(-1),
      .id_10(1),
      .id_11(-1)
  );
  localparam id_4 = id_2;
  assign id_1 = id_4;
  id_5(
      -id_4
  );
  wire id_6;
  wire id_7, id_8;
  not primCall (id_1, id_2);
endmodule
