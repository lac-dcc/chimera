// Seed: 2271687685
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input id_6;
  input id_5;
  output id_4;
  inout id_3;
  output id_2;
  input id_1;
  reg id_6;
  assign id_4 = 1'b0;
  initial begin
    if (id_6) begin
      case (1)
        id_1: id_4 <= id_5;
        1: begin
          id_4 <= 1;
        end
        default: id_6 = 1;
      endcase
    end
    id_6 <= 1;
    if (id_3) begin
      id_4 <= 1;
      id_2 = id_1;
      id_3 <= 1;
    end else begin
      id_3 = id_3;
    end
  end
endmodule
