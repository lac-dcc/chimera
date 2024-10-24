// Seed: 2184590734
`default_nettype id_0
`define pp_1 0
module module_0 ();
  always @(1 or negedge 1) begin
    if (!id_0) begin
      id_0 <= 1;
    end else begin
      if (1 == id_0)
        if (1) begin
          id_0 <= id_0;
          id_0 <= id_0 ? 1'b0 : 1;
          id_0 = id_0;
        end else begin
          SystemTFIdentifier({id_0, id_0} >> 1, 1);
          id_0 = id_0;
        end
    end
  end
endmodule
