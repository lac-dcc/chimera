// Seed: 1800785898
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout tri id_3;
  output reg id_2;
  input wire id_1;
  assign id_3 = -1'b0;
  always_latch @(-1'b0) id_2 <= id_1(id_3);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_3
  );
  output reg id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(id_5 or posedge -1'b0) begin : LABEL_0
    id_4 = id_5;
  end
endmodule
