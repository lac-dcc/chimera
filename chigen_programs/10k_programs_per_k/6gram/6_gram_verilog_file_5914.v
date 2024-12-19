// Seed: 5774735
module module_0;
  always
    repeat (1) begin : LABEL_0
      id_1 <= 1'd0;
      id_1 = id_1;
      id_1 <= id_1;
      id_1 = id_1 || 1 - id_1;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  always @* id_1 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output supply0 id_0,
    output logic   id_1,
    input  logic   id_2
);
  assign id_1 = 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_4;
  always id_1 <= #(1) id_2;
endmodule
