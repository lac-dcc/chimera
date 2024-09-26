// Seed: 3073068683
`timescale 1ps / 1ps
module module_0 (
    output logic id_0,
    output id_1,
    input id_2,
    output id_3,
    output id_4
);
  type_7(
      1, 1, id_0, id_4, 1
  );
  reg id_5;
  assign id_3[1] = id_2;
  always @(id_2 or negedge id_2) begin
    if (1) id_1 <= #id_2 id_5;
    else begin
      id_1 <= id_5;
    end
  end
endmodule
