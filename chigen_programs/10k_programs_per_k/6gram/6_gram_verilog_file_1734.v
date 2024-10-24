// Seed: 1782804167
module module_0 (
    input  id_0,
    input  id_1,
    output id_2,
    output id_3,
    output id_4
);
  initial begin
    SystemTFIdentifier(1, id_1, id_0);
    id_3 <= id_0(1'h0, id_1, 1, 1'b0 == id_1);
  end
endmodule
