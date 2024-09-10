// Seed: 2093408582
`timescale 1 ps / 1ps
`define pp_1 0
`timescale 1ps / 1ps
module module_0 #(
    parameter id_2 = 32'd37,
    parameter id_3 = 32'd98
) (
    id_1,
    _id_2,
    _id_3,
    id_4
);
  input id_4;
  input _id_3;
  output _id_2;
  input id_1;
  always @(posedge ~id_3) begin
    id_1 = id_2;
    id_4 = id_3;
    id_3 = id_2 | 1;
    if (id_1) begin
      id_2 <= id_1;
      id_1 <= id_2[1 : 1'b0];
    end
    id_4[id_2-1 : 1] = 1 && id_4 && {id_4, ~id_1, id_4, id_1 & 1'b0};
    if (1 && 1)
      if (id_3[1]) begin
        casez (id_2[(1)])
          id_2 * 1: id_2 <= 1'b0;
          id_1: begin
            if (id_1[1'b0!=1*1]) if ({id_1, 1}) id_3 = 1 == !id_2[~id_2];
          end
        endcase
        if (id_2) id_3 <= id_1;
        else begin
          id_3 <= !id_4;
        end
      end else id_1[id_2 : id_3] <= (id_3);
    id_3 <= 1;
    id_1 <= id_4;
  end
endmodule
