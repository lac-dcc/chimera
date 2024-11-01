// Seed: 2414006743
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_4(
      .id_0(1),
      .id_1(id_1),
      .id_2(1),
      .id_3(id_3),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(id_2),
      .id_9(1),
      .id_10(id_1),
      .id_11(1 < id_1),
      .id_12(id_2),
      .id_13(id_3)
  );
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  always @("") begin
    #1 id_2 = 1;
  end
  wire id_3;
  wire id_4;
  module_0(
      id_3, id_3, id_4
  );
  assign id_4#(.id_1(1)) = ~id_1;
endmodule
