// Seed: 1435863578
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
  assign module_1.id_5 = 0;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output logic [7:0] id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_1
  );
  inout wire id_1;
  always_latch @(posedge id_1) begin : LABEL_0
    id_5.id_6.id_7.id_8(1'b0);
    id_6 = -1;
  end
  assign id_3[1'b0] = -1;
endmodule
