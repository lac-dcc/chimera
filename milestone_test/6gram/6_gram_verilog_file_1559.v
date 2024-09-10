// Seed: 2022187008
module module_0 #(
    parameter id_2 = 32'd42,
    parameter id_3 = 32'd79,
    parameter id_4 = 32'd84,
    parameter id_8 = 32'd93
) (
    id_1,
    _id_2,
    _id_3,
    _id_4
);
  output _id_4;
  output _id_3;
  output _id_2;
  input id_1;
  type_9(
      id_4, id_4, 1, id_2[id_3[1] : 1]
  );
  reg id_5;
  logic id_6 (
      .id_0(id_5[1-:id_2[id_4]]),
      .id_1(id_4),
      .id_2(id_1 - 1 + id_4),
      .id_3(id_4),
      .id_4(id_4),
      .id_5(1)
  );
  type_11 id_7;
  logic   _id_8;
  always @(posedge id_3 ==? 1)
    if (id_5[id_8])
      if (id_4)
        if (id_5) id_6 <= 1;
        else begin
          if (1) begin
            @(posedge id_4);
          end else id_5 <= id_7;
        end
  assign id_7 = 1 ? id_8 : id_6;
  initial begin
    id_1[1] <= 1 - 1'b0;
    #1 id_4 = 1;
  end
endmodule
`timescale 1ps / 1 ps
module module_1 (
    output id_2,
    input id_3,
    input reg id_4,
    output id_5
);
  assign id_1[1] = 1;
  assign id_2 = id_4;
  logic id_6;
  always @(1 or negedge 1'h0) begin
    id_4 <= 1;
  end
endmodule
