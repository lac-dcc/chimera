// Seed: 330593457
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  supply0 id_5;
  assign id_5 = 1;
  logic [7:0] id_6;
  assign id_6[1'h0] = 1;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  wire id_3;
  reg  id_4;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_5
  );
  always @(negedge id_3) begin : LABEL_0
    if (1) if (id_1) id_4 <= ~id_1;
  end
  wire id_6;
  assign id_2 = 1;
endmodule
