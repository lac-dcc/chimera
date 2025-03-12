// Seed: 528685420
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  input wire id_7;
  assign module_1.id_1 = 0;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = id_4;
endmodule
module module_1 #(
    parameter id_3 = 32'd90
) (
    output tri id_0,
    output tri id_1
);
  wire _id_3;
  wire id_4;
  logic [id_3 : id_3] id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_4
  );
  always @(posedge id_3) begin : LABEL_0
    disable id_6;
  end
endmodule
