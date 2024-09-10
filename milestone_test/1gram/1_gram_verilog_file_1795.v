// Seed: 1047230128
`timescale 1ps / 1ps
module module_0 #(
    parameter id_4 = 32'd67,
    parameter id_7 = 32'd35
) (
    input id_2,
    input id_3,
    input logic _id_4,
    output reg id_5,
    output id_6,
    output logic _id_7,
    input reg id_8
);
  reg   id_9;
  logic id_10;
  reg   id_11;
  assign id_1 = id_5;
  assign id_9 = 1;
  initial begin
    begin
      begin
        begin
          begin
            if (id_10) id_7 = 1;
            id_11 = 1'b0;
            begin
              id_5 = ~id_8;
            end
          end
        end
      end
      @(id_10) id_3 = 1;
    end
    id_4 <= 1;
    id_6 <= 1;
    @(negedge 1) id_8[id_4][id_7] <= 1;
    #1 id_2 <= id_1;
    @(posedge 'd0) begin
      begin
        if (1'b0) id_9 <= id_11;
        else begin
          #1 id_1 <= id_3["" : 1'b0];
        end
        id_6 = id_11;
        id_7 <= id_5;
      end
    end
    id_11.id_1 <= #1 1'b0;
  end
endmodule
