// Seed: 1556385302
module module_0 (
    output logic id_0,
    input  logic id_1
);
  assign id_0 = 1;
  always #1 @(posedge 1 or posedge id_1) id_0 = 1 & 1;
endmodule
