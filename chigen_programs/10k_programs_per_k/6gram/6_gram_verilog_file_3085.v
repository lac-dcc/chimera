// Seed: 1568448766
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(negedge id_1) begin : LABEL_0
    id_4 = 1 ? 1 : 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  wire id_8 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_2,
      id_7
  );
  initial begin : LABEL_0
    #1;
    $display(1'b0, 1);
  end
  always @(posedge 1 or posedge 1) if (id_6 || 1) id_6 <= 1 == 1;
endmodule
