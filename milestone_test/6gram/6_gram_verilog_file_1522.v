// Seed: 2754919842
`timescale 1ps / 1ps
module module_0 #(
    parameter id_1 = 32'd84
) (
    input _id_1,
    input id_2,
    output id_3,
    input id_4,
    input id_5,
    output reg id_6,
    input id_7,
    output reg id_8
);
  always #1 begin
    if (id_1) id_8 <= id_7[1'b0];
    else begin
      for (id_2 = id_7; id_7; id_7 = 1) @(posedge id_4[1][1]);
      id_1 <= id_2;
      id_7 <= id_2;
      id_1 <= id_6;
      id_4[1] <= "";
      if (1'b0) id_5 = id_2[id_1];
      else if (1'b0) id_8 <= #1 1;
    end
  end
  always @(1) begin
    id_4 <= id_6;
  end
  reg   id_9 = id_4;
  logic id_10;
endmodule
