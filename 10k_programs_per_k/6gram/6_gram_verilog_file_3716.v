// Seed: 2438196402
module module_0 (
    input id_0,
    output wor id_1,
    output id_2,
    input id_3,
    input logic id_4,
    input logic id_5,
    output id_6,
    output logic id_7
);
  logic id_8;
  reg id_9, id_10;
  assign id_7 = id_8 ? 1'd0 : id_8;
  always @(1, posedge id_9 * 1 * id_0 or 1'b0) begin
    if (id_4) begin
      if (id_10) id_9 = 1'b0 + 1;
      else begin
        #1;
        id_9 <= 1;
        SystemTFIdentifier((1), id_8, id_3, 1);
        #1 id_2 = "" - (!id_9);
      end
    end else id_1[1] <= 1;
  end
endmodule
