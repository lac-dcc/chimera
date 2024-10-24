// Seed: 952529919
`timescale 1ps / 1ps
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input id_7;
  input id_6;
  output id_5;
  input id_4;
  inout id_3;
  input id_2;
  inout id_1;
  reg id_7;
  always #1 begin
    id_3 <= 1;
  end
  type_0 id_8 (
      .id_0(id_3),
      .id_1(id_5),
      .id_2(id_4)
  );
  logic id_9;
  assign id_1 = id_7;
  always @(posedge id_7 < id_6) begin
    id_5 <= 1;
    if (1) id_3 <= id_7;
  end
  assign id_5 = 1;
endmodule
