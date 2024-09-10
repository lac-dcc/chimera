// Seed: 1699099454
`timescale 1ps / 1ps
module module_0 #(
    parameter id_4 = 32'd30,
    parameter id_5 = 32'd62,
    parameter id_6 = 32'd23
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5
);
  input _id_5;
  input _id_4;
  input id_3;
  output id_2;
  input id_1;
  always @(posedge 1) begin
    id_5 = id_4;
  end
  logic _id_6;
  always @(posedge id_6) begin
    id_3 <= 1;
  end
  always @(posedge id_5[id_4 : id_5]) begin
    id_4 <= 1;
    integer id_7;
    id_3 <= 1'd0;
  end
  initial begin
    id_1 <= id_2[id_6][id_6];
    id_2 <= #id_8 id_5;
    id_4 = 1;
    if (id_8) SystemTFIdentifier(!id_2);
    else id_5 <= ~id_5;
  end
endmodule
