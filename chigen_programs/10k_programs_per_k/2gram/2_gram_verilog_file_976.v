// Seed: 2933280695
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output id_4;
  inout id_3;
  inout id_2;
  output id_1;
  always begin
    id_2 = id_3;
    @(id_2) begin
      id_1 = id_3;
      SystemTFIdentifier(id_3);
      id_3 <= 1;
    end
  end
endmodule
