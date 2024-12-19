// Seed: 2609207881
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  id_5(
      .id_0("" - 1'd0),
      .id_1(id_3),
      .id_2(id_4),
      .id_3(id_4),
      .id_4(id_2),
      .id_5(1'b0 != id_1),
      .id_6(id_3 - 1'd0 && id_2.id_3)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_8(
      .id_0(1)
  ); specify
    if (id_2 > id_3[1==1]) (negedge id_9 => (id_10 +: 1)) = (id_2, 1);
    specparam id_11 = 1;
  endspecify
  module_0 modCall_1 (
      id_2,
      id_5
  );
endmodule
