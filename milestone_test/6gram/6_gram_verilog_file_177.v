// Seed: 4175721462
`timescale 1ps / 1 ps
module module_0 #(
    parameter id_1 = 32'd80,
    parameter id_3 = 32'd56
) (
    input _id_1,
    output logic id_2,
    output _id_3,
    input reg id_4,
    input id_5,
    output logic id_6
);
  logic id_7;
  logic id_8 = id_7;
  always @(posedge id_8) begin
    case (id_5)
      id_6: id_3 = id_3[id_3!=-id_1 : 1];
      id_8: id_7 = id_2;
      1: id_4 <= id_5 < id_6;
      1: id_3 = id_2 == id_5;
    endcase
  end
endmodule
