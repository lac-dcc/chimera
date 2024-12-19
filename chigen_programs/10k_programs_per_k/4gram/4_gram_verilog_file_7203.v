// Seed: 3343161101
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(1 or negedge id_1) begin : LABEL_0
    id_2 = 1;
    deassign id_2[1];
  end
endmodule
module module_1 ();
  id_3(
      .id_0(id_4),
      .id_1(id_5),
      .id_2(1),
      .id_3(id_5),
      .id_4(id_4),
      .id_5(id_4),
      .id_6(id_1),
      .min(1),
      .id_7(id_2)
  );
  assign id_4 = (1);
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_4,
      id_4,
      id_6,
      id_4
  );
  assign id_5 = id_5;
endmodule
