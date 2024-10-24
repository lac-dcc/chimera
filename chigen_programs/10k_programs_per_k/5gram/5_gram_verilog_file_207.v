// Seed: 1832769902
module module_0 (
    input  reg id_0,
    output reg id_1,
    input  reg id_2
);
  assign id_1 = id_2;
  always @(posedge 1) begin
    #1;
    if (1) id_1 <= #1 id_0;
  end
endmodule
`resetall
