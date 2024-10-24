// Seed: 964270901
module module_0 (
    input reg id_0,
    output id_1,
    output id_2
);
  initial begin
    id_2 = 1;
    id_1 <= 1;
    id_2 <= 1;
    id_2 <= id_0 + 1'b0 * 1'd0;
    id_1 = 1;
    id_1 <= 1 ? id_0 : id_0;
    id_2 = id_0;
    id_1 <= 1;
    SystemTFIdentifier(id_0);
    id_1 = id_0 & 1'b0;
  end
endmodule
