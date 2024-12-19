// Seed: 48915516
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @((1'b0) or posedge 1) id_2 = 1;
  id_5(
      .id_0(1'h0), .id_1(id_2), .id_2(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3
  );
endmodule
