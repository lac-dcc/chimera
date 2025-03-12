// Seed: 3327048349
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
  inout wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_1 = 32'd12
) (
    _id_1,
    id_2
);
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  input wire _id_1;
  wire [id_1 : -1] id_3;
  reg id_4;
  always @(posedge -1) id_4 <= -1;
  assign id_2 = id_1 - 1;
  assign id_3 = id_4;
  assign id_4 = 1;
  assign id_2 = id_4;
  always @(*) begin : LABEL_0
    return (id_2);
  end
endmodule
