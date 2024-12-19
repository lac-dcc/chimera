// Seed: 4261620776
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  id_3(
      .id_0(id_4),
      .id_1(id_4 - id_4),
      .id_2(id_2),
      .id_3(1),
      .id_4(1 == ""),
      .id_5(id_4),
      .id_6(id_2 - 1'b0)
  );
  always
    if ((id_4 ? id_4 : 1'd0)) id_1 <= 1;
    else id_4 <= id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(1 or posedge id_3 == 1) if (id_3) id_3 <= id_2;
  module_0 modCall_1 (
      id_3,
      id_1
  );
endmodule
