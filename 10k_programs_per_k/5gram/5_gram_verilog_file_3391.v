// Seed: 1937129116
module module_0 (
    output reg id_0,
    input id_1,
    output logic id_2,
    output id_3,
    input logic id_4
);
  reg id_5, id_6, id_7;
  logic id_8;
  assign id_2 = id_8;
  always @(*) begin
    if (1) id_8 = 1;
    else begin
      if (id_1) begin
        #1;
        id_7 <= 1;
        if (id_4) begin
          case (1)
            1: id_2 = id_1;
            default: id_5 <= id_6;
          endcase
        end else begin
          id_0 <= 1'b0;
        end
      end else begin
        id_5 <= 1;
      end
    end
  end
  logic id_9;
endmodule
