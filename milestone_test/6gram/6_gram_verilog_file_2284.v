// Seed: 3561177473
`timescale 1 ps / 1ps
module module_0 #(
    parameter id_1 = 32'd29,
    parameter id_2 = 32'd82,
    parameter id_4 = 32'd30
) (
    output _id_1,
    output logic _id_2,
    input id_3,
    input _id_4,
    output id_5
);
  initial begin
    case (1)
      id_2[id_4[1 : 1]]: id_3 <= id_5 + id_2 & 1;
      id_5: id_4 = id_3;
      1: begin
        if (id_1) begin
          id_4 <= 1'b0;
        end
      end
      1: begin
        id_3 = id_3;
      end
      id_5[id_1==id_2]: id_4 = id_5;
      id_4: id_3 = id_4;
      1'b0: id_4 = 1 == 1'b0;
      default: id_2 <= id_3;
    endcase
  end
endmodule
