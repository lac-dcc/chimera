// Seed: 3609855742
`timescale 1ps / 1ps
module module_0 (
    input reg id_0,
    input id_1,
    output id_2
);
  type_15 id_3 (
      .id_0(id_2),
      .id_1(!id_2)
  );
  reg   id_4 = id_0;
  reg   id_5;
  reg   id_6;
  logic id_7 = 1;
  defparam id_8.id_9 = 1;
  reg id_10, id_11;
  reg id_12;
  always @(id_8 or posedge 1) id_12 <= #id_1 1;
  logic id_13;
  assign id_5 = id_10;
  initial begin
    id_4  <= id_10;
    id_11 <= 1'b0;
    id_11 <= 1;
    id_6  <= 1;
  end
endmodule
