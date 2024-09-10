// Seed: 2250041715
module module_0 #(
    parameter id_1 = 32'd11
);
  always @(1'b0, posedge id_1) begin
    id_1 = id_1;
    id_1[id_1 : 1] <= id_1[id_1 : id_1[1]*id_1-1&1'b0];
  end
endmodule
