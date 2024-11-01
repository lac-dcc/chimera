// Seed: 656532454
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  always @(posedge id_2) id_2 <= 1;
  id_3(
      .id_0(1'b0),
      .id_1(),
      .id_2(id_2),
      .id_3(id_1),
      .id_4(1),
      .id_5(id_1),
      .id_6((id_4)),
      .id_7(~id_1 == 1),
      .id_8(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(id_4 or id_1)
    if (1) disable id_5;
    else id_5 <= 1;
  module_0(
      id_4, id_5
  );
endmodule
