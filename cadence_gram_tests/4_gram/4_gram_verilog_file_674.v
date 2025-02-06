// Seed: 1626540910
module module_0 (
    id_1
);
  output wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_3 = id_1;
  module_0 modCall_1 (id_4);
  id_7(
      .id_0(id_1[$realtime]), .id_1($realtime), .id_2(id_6)
  );
  wire id_8;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  assign id_1 = ($realtime);
  assign id_5[$realtime] = (-1);
  module_0 modCall_1 (id_1);
endmodule
