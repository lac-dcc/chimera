// Seed: 2395503657
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  wire id_3;
  wire id_4;
  id_5(
      .id_0()
  );
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  id_3(
      $realtime, 1 && $realtime, id_4, id_1
  );
  module_0 modCall_1 (
      id_1,
      id_2
  );
  id_5(
      id_1, 1, $realtime, id_2
  );
  wire id_6, id_7;
  id_8(
      .id_0(id_5), .id_1(-1), .id_2(id_7), .id_3(id_7), .id_4()
  );
endmodule
