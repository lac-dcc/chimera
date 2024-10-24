// Seed: 703349028
module module_0 (
    input  id_0,
    input  id_1,
    input  id_2,
    output id_3
);
  assign id_3 = 1 ? 1 : id_0 ? 1 : id_2;
  always #1 begin
    SystemTFIdentifier;
  end
  generate
    assign id_3 = id_0;
  endgenerate
endmodule
