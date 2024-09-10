// Seed: 2913368964
`timescale 1ps / 1ps
module module_0 (
    id_1,
    id_2,
    id_3
);
  input id_3;
  output id_2;
  input id_1;
  always @(posedge id_2)
    if (1 && id_1)
      if (1'b0) id_2 <= 1'b0;
      else begin
        if (1) begin
          if (id_2) id_3 <= 1;
          else begin
            @(posedge id_3) #1;
          end
        end
      end
endmodule
