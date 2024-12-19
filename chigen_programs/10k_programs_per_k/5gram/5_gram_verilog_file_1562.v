// Seed: 1373434606
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  wire id_5;
  initial begin : LABEL_0
    disable id_6;
  end
  assign id_1 = 1 + 1;
  logic [7:0] id_7;
  id_8(
      .id_0(1 ^ id_2), .id_1(id_7[1'd0]), .id_2(1'h0), .id_3(1'b0), .id_4()
  );
endmodule
