// Seed: 3773932390
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  reg id_3;
  always id_3 = new;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2;
  id_1(
      .id_0(id_2[1]), .id_1(1), .id_2(1 ^ 1'h0)
  );
  wand id_3;
  id_4(
      .id_0(id_3), .id_1(1 - ~id_3), .id_2(1 - id_3)
  );
  module_0 modCall_1 (
      id_3,
      id_3
  );
  wire id_5;
endmodule
