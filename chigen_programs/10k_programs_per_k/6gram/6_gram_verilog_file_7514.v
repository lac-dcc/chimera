// Seed: 992024258
module module_0;
  wire id_1, id_2, id_3;
  assign module_1.id_2 = 0;
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
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(1) begin : LABEL_0
    id_4 <= 1'b0;
    id_2 = #1 1 == (1);
  end
  assign id_4 = 'd0;
  id_8(
      .id_0(id_1), .id_1(1), .id_2(id_3), .id_3(""), .id_4(1)
  );
  module_0 modCall_1 ();
endmodule
