// Seed: 3417967186
module module_0 (
    input logic id_0,
    input id_1,
    input logic id_2,
    output id_3
);
  reg id_4 = id_2.id_0 && 1'd0 == (1 | !id_1) % 1;
  assign id_4 = id_1 && 1 == id_2;
  assign id_3 = 1;
  logic id_5;
  type_14(
      (id_4), id_3, 1, id_6
  );
  reg id_7, id_8, id_9, id_10;
  always @(id_1) begin
    #1;
    if ({id_2{1'b0}}) begin
      id_3  <= id_7;
      id_10 <= id_9;
      id_8  <= 1;
    end
  end
endmodule
`default_nettype wire
