// Seed: 3238051725
module module_0 (
    input id_0,
    input id_1,
    input id_2,
    output id_3,
    output logic id_4,
    input id_5
);
  initial begin
    id_3 <= id_1;
    if (1'b0) begin
      #1 begin
        id_3 = 1'd0 - id_5;
        #1 id_3 = 1;
      end
    end
  end
  logic id_6 = 1;
  logic id_7;
endmodule
