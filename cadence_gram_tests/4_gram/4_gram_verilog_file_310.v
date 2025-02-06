// Seed: 3561754452
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_6(
      id_1, id_1
  );
  wire id_7;
  assign id_5 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_4(
      .id_0(1), .id_1(1), .id_2($realtime)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3
  );
  id_5(
      id_3, $realtime, !id_1, id_3, id_2[-1], ($realtime)
  );
endmodule
