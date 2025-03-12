// Seed: 361149298
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wand id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd23,
    parameter id_4 = 32'd41,
    parameter id_8 = 32'd21
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7
);
  output logic [7:0] id_7;
  output logic [7:0] id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1
  );
  output wire _id_4;
  output wire id_3;
  input wire _id_2;
  inout wire id_1;
  logic [-1 'b0 : ""] _id_8;
  always @(1) begin : LABEL_0
    id_7[(id_8/{id_2, -1})] <= -1'h0 ? -1 : 1;
  end
endmodule
