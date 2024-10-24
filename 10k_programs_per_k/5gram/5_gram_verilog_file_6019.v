// Seed: 3890261420
module module_0 (
    output id_0,
    output reg id_1
);
  assign id_0 = id_2 ? id_2 : 1'b0 ? 1 : 1;
  always @(1) begin
    id_1 <= 1;
    if (!id_2) id_0 <= id_2;
    else if (id_2) begin
      id_0 <= id_2;
      id_0 = 1;
    end else begin
      case (id_2)
        id_2: id_1 <= 1;
        1'h0: begin
          if (1 + 1) begin
            if (1) id_0 <= 1;
            else begin
              id_2 = id_2 != id_2;
            end
          end
        end
        id_2: id_1 <= id_2;
        default: id_2 = 1;
      endcase
    end
  end
endmodule
