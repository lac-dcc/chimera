// Seed: 2963498902
module module_0 (
    output logic id_0,
    input  tri0  id_1,
    input  logic id_2,
    output logic id_3
);
  always @(posedge id_2, posedge id_2 / 1) begin
    id_0 <= id_2;
    $display;
    {1 == 1, 1, 1 - id_1 - 1} <= 1;
    id_3 = id_2 & id_1 & 1;
    id_3 <= id_3++;
    $display(1);
    id_0 <= 1;
  end
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  wor   id_2
);
  always id_0 = #id_4  ~id_2;
  assign id_0 = 1'd0;
  module_0(
      id_0, id_2, id_1, id_0
  );
  assign id_0 = id_1;
  assign id_4 = id_4;
endmodule
