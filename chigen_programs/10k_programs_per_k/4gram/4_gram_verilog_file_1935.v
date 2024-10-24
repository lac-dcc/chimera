// Seed: 1468522525
module module_0;
  logic id_0 = 1;
  reg   id_1 = 1;
  always @(posedge 1'b0 or posedge 1) begin
    #1 begin
      id_1 <= id_1;
      SystemTFIdentifier(1, id_1 - 1, id_1, id_1);
    end
  end
  assign id_1 = 1;
endmodule
