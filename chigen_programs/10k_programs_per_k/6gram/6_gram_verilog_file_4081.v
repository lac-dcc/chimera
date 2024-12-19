// Seed: 449141942
module module_0 #(
    parameter id_10 = 32'd5,
    parameter id_11 = 32'd1,
    parameter id_6  = 32'd61,
    parameter id_7  = 32'd30,
    parameter id_8  = 32'd78,
    parameter id_9  = 32'd5
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1;
  wire id_4;
  wire id_5;
  defparam id_6.id_7 = 1 == id_3, id_8.id_9 = id_7, id_10.id_11 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
  reg id_4;
  assign id_1 = 1;
  always @(posedge id_2 == id_2) begin : LABEL_0
    id_4 <= 1;
    id_1 <= id_2;
    id_2 <= 1;
  end
endmodule
