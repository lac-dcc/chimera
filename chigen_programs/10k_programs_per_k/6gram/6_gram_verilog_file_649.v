// Seed: 2130878311
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    output supply0 id_3,
    input uwire id_4,
    output tri id_5
);
  wire id_7;
  parameter id_8 = 1;
  logic [7:0] id_9 = id_8;
  assign id_9[-1] = id_4;
  assign id_5 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input tri1 id_2,
    output tri1 id_3,
    input wor id_4,
    input wor id_5,
    input uwire id_6,
    output wire id_7,
    output logic id_8
);
  always @(1'b0 * id_4 == 1 or posedge id_2) begin : LABEL_0
    if (-1'b0) begin : LABEL_1
      id_8 <= id_1;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_0,
      id_5,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
