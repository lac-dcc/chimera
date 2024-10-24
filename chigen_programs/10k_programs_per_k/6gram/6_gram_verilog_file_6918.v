// Seed: 3351417176
module module_0 (
    input logic id_0,
    input id_1,
    input logic id_2,
    input logic id_3
);
  logic id_4, id_5, id_6 = id_0;
  logic id_7;
  logic id_8;
  always @(negedge 1 or posedge 1) begin
    case (id_6)
      id_3: id_5 = 1;
      default: begin
        #1;
        @(negedge id_6) id_8 = 1;
      end
    endcase
  end
endmodule
