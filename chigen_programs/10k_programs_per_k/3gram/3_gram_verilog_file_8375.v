// Seed: 2821183818
`define pp_2 0
module module_0 (
    id_1,
    id_2
);
  inout id_2;
  inout id_1;
  always @(id_2)
    if (id_1) begin
      @(id_1 or negedge id_1) id_2 = 1'b0;
    end else begin
      #1 id_2 <= id_2;
      SystemTFIdentifier;
    end
endmodule
