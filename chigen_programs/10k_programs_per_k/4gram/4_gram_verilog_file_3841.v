// Seed: 2575141437
module module_0;
  logic [7:0] id_2;
  assign id_1 = 1;
  assign id_2[1] = {id_1, 1, 1, id_1, 1, 1'b0} & "";
  assign id_1 = id_1;
endmodule
module module_1 #(
    parameter id_16 = 32'd52,
    parameter id_17 = 32'd78
) (
    input  tri0  id_0,
    output wand  id_1,
    output logic id_2,
    input  tri   id_3,
    input  tri   id_4,
    input  logic id_5,
    input  tri1  id_6,
    input  wor   id_7,
    input  tri   id_8,
    output tri0  id_9
);
  wire id_11;
  always_latch @* begin : id_12
    if (id_12) id_2 <= id_5;
  end
  tri  id_13;
  wire id_14;
  tri  id_15;
  assign id_13 = id_0 < 1;
  assign id_15 = 1'b0 + id_6;
  defparam id_16.id_17 = 1 == 1'h0; module_0(); id_18 :
  assert property (@(posedge id_16) id_14)
  else $display;
endmodule
