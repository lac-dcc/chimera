// Seed: 2972325217
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_5(
      .id_0(1), .id_1(1)
  );
  assign module_1.id_3 = 0;
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
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always_comb @(*)
    if (id_2) begin : LABEL_0
      id_5 = 1;
      id_3 <= 1;
      id_5 <= 1'b0;
      id_5 <= #1 1;
    end else id_6 <= id_5;
  assign id_4 = id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
