// Seed: 1934116300
`timescale 1ps / 1ps
module module_0 #(
    parameter id_1 = 32'd30,
    parameter id_2 = 32'd62,
    parameter id_3 = 32'd23,
    parameter id_4 = 32'd67
) (
    output _id_2,
    input _id_3,
    input logic _id_4,
    output id_5
);
  always @(*) begin
    if (~id_4) begin
      case (id_3 - 1)
        1'b0: id_5 <= id_2;
        id_5, id_4, 1, id_3 == 1, 1, 1'd0, id_1[id_4[id_3]&id_3 : 1], id_5[id_1[1 : id_2]*1], 1'b0:
        id_4 = id_5[id_4] == id_3[id_4 : 1];
        ~id_4: id_2 <= 1;
        id_3: begin
          id_1 <= id_3;
        end
      endcase
    end
  end
endmodule
