// Seed: 3531132766
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
  reg  id_7;
  initial begin : LABEL_0
    id_3 <= id_2 & ~id_2 < (1);
    if (id_2) begin : LABEL_0
      id_7 <= 1'b0;
      $display(1);
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  always force id_1 = id_4;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_4,
      id_5
  );
endmodule
