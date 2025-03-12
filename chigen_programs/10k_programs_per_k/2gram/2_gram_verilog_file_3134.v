// Seed: 3181093966
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wor id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  assign id_5 = 1;
  assign id_2 = id_6;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  bit id_2;
  parameter id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  always_ff @* begin : LABEL_0
    id_2 = -1;
    if (1) begin : LABEL_1
      id_2 <= 1;
    end
    @(id_2 or 1) id_2 = 1'b0;
  end
endmodule
