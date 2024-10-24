// Seed: 1507678244
module module_0;
  reg id_1;
  always @(negedge 1)
    if (1) begin
      id_1 = 1;
    end else begin
      if (id_1 & id_0) begin
        SystemTFIdentifier(1);
        SystemTFIdentifier(id_1);
      end else id_1 <= id_0;
    end
  assign id_1 = 1;
endmodule
