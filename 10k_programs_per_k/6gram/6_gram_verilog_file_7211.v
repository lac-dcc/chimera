// Seed: 3144186663
module module_0 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2
);
  assign id_2 = id_1 & 1 << id_0;
  logic id_3 = id_1;
  logic id_4;
  type_0 id_5 (
      .id_0(id_0),
      .id_1(id_2),
      .id_2((1 ? id_1 : id_2)),
      .id_3((id_2)),
      .id_4(1),
      .id_5(id_3),
      .id_6(1),
      .id_7(1),
      .id_8(id_1)
  );
endmodule
