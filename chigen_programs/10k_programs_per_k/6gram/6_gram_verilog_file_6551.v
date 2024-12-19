// Seed: 2681506917
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5(
      .id_0(id_4.id_1 | (1'h0)), .id_1(id_4), .id_2(id_3 < id_2)
  );
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
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(negedge id_3) begin : LABEL_0
    if (id_3) begin : LABEL_0
      deassign id_5;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
