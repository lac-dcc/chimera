// Seed: 2804430224
`define pp_1 0
`timescale 1ps / 1 ps
module module_0 (
    id_1,
    id_2
);
  output id_2;
  input id_1;
  logic id_3;
  logic id_4;
  type_0 id_5 (
      .id_0(1),
      .id_1(id_3)
  );
endmodule
`timescale 1 ps / 1ps
module module_1 #(
    parameter id_3 = 32'd40,
    parameter id_4 = 32'd26
) (
    output id_1,
    input  id_2,
    output _id_3
);
  integer _id_4;
  assign id_3 = 1;
  always @(1) begin
    #1;
    if (id_1) begin
      id_2[1'd0 : 1] = id_4;
    end
  end
  reg id_5;
  initial begin
    id_1 <= 1;
    SystemTFIdentifier(id_4[1 : id_3], id_3);
    id_5 <= 1;
    id_1 = id_2[id_4[1]];
  end
endmodule
