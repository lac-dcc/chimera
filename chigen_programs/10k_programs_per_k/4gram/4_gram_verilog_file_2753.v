// Seed: 3731518386
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_7;
  assign #id_8 id_5 = 1;
  always @(*) begin : LABEL_0
    id_7 <= 1;
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
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1[1] = 1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_4,
      id_2,
      id_4
  );
endmodule
