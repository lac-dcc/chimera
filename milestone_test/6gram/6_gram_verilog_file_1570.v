// Seed: 810237546
`timescale 1ps / 1ps
module module_0 #(
    parameter id_3 = 32'd80,
    parameter id_6 = 32'd86
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6
);
  output _id_6;
  output id_5;
  input id_4;
  output _id_3;
  input id_2;
  input id_1;
  always @(1'h0 or posedge id_4) begin
    #1;
    id_6 = id_5;
    id_2 = id_2;
    id_6[id_6 : 1'd0] = 1'h0;
    if (1) if (id_1) id_3 <= 1;
    id_2 <= id_4;
  end
  reg id_7;
  type_1 id_8 (
      .id_0(1'b0),
      .id_1(1),
      .id_2(1),
      .id_3(1'h0),
      .id_4(1),
      .id_5(id_6 == 1),
      .id_6(1),
      .id_7(id_5)
  );
  initial
    #(id_7)
      if (1) begin
        id_7 <= id_2 - id_3;
      end else id_4[1] <= id_4 == id_4[id_3[1]];
endmodule
