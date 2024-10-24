// Seed: 2011422456
`timescale 1 ps / 1ps
module module_0;
  generate
    if (id_0) begin : id_1
      always @(posedge 1'b0) begin
        id_1 <= #id_0 id_0;
        SystemTFIdentifier;
      end
      always @(posedge id_0) begin
        id_1 <= id_0 < 1;
        id_0 <= 1'b0;
      end
    end
  endgenerate
endmodule
