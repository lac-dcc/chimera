// Seed: 795724928
module module_0 (
    input logic id_2,
    output id_3,
    input id_4
);
  if (id_2)
    if (id_4) begin
      assign id_4 = (id_3);
    end else if (id_3) begin : id_5
      always @(negedge 1'b0) id_3 = 1;
      always @(posedge id_4 or posedge 1'b0) begin
        id_1 <= 1;
      end
    end
endmodule
