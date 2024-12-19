// Seed: 353692879
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = 1'h0;
  assign id_3 = id_2 == id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge 1) begin : LABEL_0
    cover (id_6[1] || id_1);
  end
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5
  );
endmodule
