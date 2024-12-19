// Seed: 3482738062
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_5;
  always @(posedge id_3 or posedge id_4 - id_3) begin : LABEL_0
    if (id_1)
      if (1'b0) id_4 = 1;
      else id_1 <= id_2;
  end
  assign id_5 = 1'd0;
  assign id_4 = !1;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  always id_5 <= 1'b0;
endmodule
