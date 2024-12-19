// Seed: 3419728134
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_8 <= id_1;
  end
  always @(posedge id_3 or posedge id_7) begin : LABEL_0
    id_6 <= id_6;
    assume (id_6 >= 1);
  end
  wire id_9;
  final begin : LABEL_0
    wait (1);
    id_8 <= {(1) {1'b0}};
  end
  module_0 modCall_1 (id_4);
  wire id_10;
endmodule
