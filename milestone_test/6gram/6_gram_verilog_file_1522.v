// Seed: 2672635337
module module_0 ();
  reg id_1;
  reg id_2;
  always @(1'b0) begin
    id_2 <= 1;
    case (id_2)
      id_1: begin
        id_1 <= 1 - 1;
      end
      1'd0: id_1 = 1;
      id_1: id_2 = 1 + id_2;
      1: begin
        id_1 = 1'b0;
      end
    endcase
  end
endmodule
