// Seed: 3942722688
`default_nettype id_1
module module_0 #(
    parameter id_1 = 32'd49,
    parameter id_2 = 32'd21
);
  logic _id_2;
  always @(id_1 or posedge id_2[1'b0]) begin
    id_1 = id_1[1'b0 : id_1];
    id_1[id_2] <= id_2;
  end
endmodule
