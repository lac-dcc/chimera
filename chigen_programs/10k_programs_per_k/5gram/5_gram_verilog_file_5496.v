// Seed: 3083271082
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    module_0
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  uwire id_7;
  wire  id_8;
  always_comb @(id_7 or negedge 1) begin
    id_7 = 1;
  end
  rnmos (1, id_4 == 1);
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  nand (id_2, id_1, id_3);
  module_0(
      id_3, id_3, id_1, id_1, id_3, id_2
  );
endmodule
