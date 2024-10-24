// Seed: 3739437424
module module_0 (
    output logic id_0,
    output logic id_1,
    input id_2,
    output id_3
);
  logic id_4;
  logic id_5;
  initial begin
    id_3 <= 1;
    if (1) begin
      id_0 = 1;
    end else begin
      @(posedge 1) id_3 = id_2;
    end
  end
endmodule
module module_1 (
    input logic id_0,
    input id_1,
    output logic id_2
);
  assign id_2 = id_0;
  always @(*) begin
    if (1) begin
      id_2 = 1;
    end else id_2 = 1;
  end
  always #0 begin
    SystemTFIdentifier(1);
  end
endmodule
