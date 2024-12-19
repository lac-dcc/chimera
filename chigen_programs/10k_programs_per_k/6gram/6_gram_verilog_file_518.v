// Seed: 2568168894
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  always @(posedge id_3 or posedge id_5) begin : LABEL_0
    id_1 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_4 or posedge id_4) begin : LABEL_0
    assign id_2.id_2 = id_4;
  end
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_5,
      id_5
  );
endmodule
