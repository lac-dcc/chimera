// Seed: 2212688646
`timescale 1ps / 1 ps
module module_0 #(
    parameter id_4 = 32'd72,
    parameter id_5 = 32'd36,
    parameter id_6 = 32'd11
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
  assign id_5[id_4] = id_3;
  type_7 _id_6 (
      .id_0(id_3[1-id_5 : id_4]),
      .id_1(id_5),
      .id_2(id_4)
  );
  always @(posedge 1 + !id_5 & id_1) begin
    id_2 <= id_6[id_6];
  end
endmodule
