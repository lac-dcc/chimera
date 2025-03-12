// Seed: 997706249
module module_0 (
    id_1,
    id_2
);
  inout wor id_2;
  output wire id_1;
  assign id_1 = &id_2;
  parameter id_3 = 1;
  assign id_2 = {1{id_3}};
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
  module_0 modCall_1 (
      id_4,
      id_5
  );
  inout wire id_5;
  inout wire id_4;
  inout reg id_3;
  inout wire id_2;
  input wire id_1;
  always @(-1'h0 == id_3 or posedge id_2) begin : LABEL_0
    id_3 <= -1'd0 - id_1;
  end
endmodule
