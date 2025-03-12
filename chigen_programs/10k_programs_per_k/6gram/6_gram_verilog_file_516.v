// Seed: 4181364715
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  assign module_1.id_2 = 0;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout reg id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  output reg id_2;
  output wire id_1;
  always @(posedge 1'b0 or posedge id_5) begin : LABEL_0
    id_5 <= id_5;
    id_2 <= id_5;
    id_2 <= id_3 == id_5;
  end
endmodule
