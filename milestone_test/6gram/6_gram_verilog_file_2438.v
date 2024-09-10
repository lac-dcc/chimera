// Seed: 422294168
module module_0 #(
    parameter id_4 = 32'd67
) (
    input id_1,
    input id_2,
    input logic id_3,
    output logic _id_4
);
  logic id_5 = id_4 - id_3;
  assign id_1[id_4] = id_3 ? 1 : id_3;
  logic id_6;
  type_13(
      id_2, 1'h0, 1, id_7
  );
  type_0 id_8 (
      .id_0(1),
      .id_1(1),
      .id_2(1 + {id_4, 1, id_5, 1, 1, 1, id_1, id_3, id_2, 1'b0}),
      .id_3(id_6),
      .id_4(id_2),
      .id_5((id_5))
  );
endmodule
