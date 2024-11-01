// Seed: 2049915679
module module_0;
  reg id_1;
  assign id_1 = 1;
  reg id_2;
  reg id_3;
  assign id_2 = id_1;
  always #(id_2)
    if (id_2) begin
      if (1'b0) id_3 = 1'd0;
      else id_3 <= id_2;
    end
  assign id_1 = id_2;
  initial begin
    id_1 <= 1;
  end
  wire id_4;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri  id_1,
    input  wire id_2,
    input  tri  id_3,
    output wor  id_4,
    input  tri1 id_5,
    output tri0 id_6,
    output tri  id_7,
    input  tri  id_8
);
  wire id_10;
  wire id_11;
  tri0 id_12;
  module_0();
  assign id_12 = id_5;
  assign id_10 = id_2;
  and (id_1, id_10, id_11, id_12, id_2, id_3, id_5, id_8);
endmodule
