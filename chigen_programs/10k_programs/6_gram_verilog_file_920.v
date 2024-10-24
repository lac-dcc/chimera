// Seed: 188996828
`define pp_6 0
`define pp_7 0
`define pp_8 0
`define pp_9 0
`define pp_10 0
`define pp_11 0
`timescale 1 ps / 1ps `resetall `timescale 1 ps / 1 ps
module module_0 (
    output id_0,
    output id_1,
    output wand id_2,
    input reg id_3,
    input reg id_4,
    input id_5
);
  always @(posedge id_4 or negedge 1) begin
    if (id_4 && id_3 == 1) id_0 <= id_4;
    else begin
      if (1) begin
        id_0 <= id_3;
      end
      if (~(1)) begin
        id_0 = 1'h0;
      end else begin
        id_1 <= {1, 1};
      end
    end
  end
  type_10 id_6 (
      .id_0(id_1),
      .id_1(id_5),
      .id_2(1 - id_3),
      .id_3(1),
      .id_4(id_2['b0]),
      .id_5(1),
      .id_6(1 + id_3),
      .id_7(1'b0 == id_4)
  );
  assign id_0 = id_3 ? id_4 : 1;
endmodule
