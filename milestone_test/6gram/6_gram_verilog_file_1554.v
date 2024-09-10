// Seed: 1147054611
module module_0 #(
    parameter id_1 = 32'd23,
    parameter id_3 = 32'd67,
    parameter id_5 = 32'd35
) (
    _id_1,
    id_2,
    _id_3,
    id_4
);
  input id_4;
  input _id_3;
  output id_2;
  input _id_1;
  type_0 _id_5 (
      .id_0(1),
      .id_1((id_2 == id_4) ^ (id_3)),
      .id_2(1'b0),
      .id_3(1),
      .id_4(id_1),
      .id_5('b0),
      .id_6(id_4 * 1 ** id_3[1 : id_3] - id_1),
      .id_7(id_2)
  );
  assign id_4[1] = id_5;
  assign id_4[-id_3] = id_4;
  assign id_4 = 1;
  assign id_2 = id_3[id_1[id_3 : ~id_5] : 1];
  always @* if (1'b0) if (1) id_3 <= 1;
endmodule
