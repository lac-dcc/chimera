// Seed: 78002246
`timescale 1 ps / 1ps
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout id_10;
  input id_9;
  input id_8;
  input id_7;
  inout id_6;
  output id_5;
  output id_4;
  inout id_3;
  inout id_2;
  output id_1;
  type_10(
      id_3, 1
  );
  always @(id_9) begin
    if ((id_10 ? 1 : 1)) begin
      id_5 <= 1;
    end
  end
  always #1 begin
    if (id_10) id_1 <= 1;
    else begin
      id_4 <= id_3;
    end
  end
endmodule
