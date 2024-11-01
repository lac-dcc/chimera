// Seed: 1519857488
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output tri1  id_4,
    output wire  id_5,
    input  tri   id_6,
    input  tri1  id_7,
    input  tri0  id_8
);
  supply1 id_10, id_11, id_12, id_13 = 1'd0;
  wire id_14;
  assign id_13 = 1;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    input uwire id_2,
    output tri1 id_3,
    input tri1 id_4,
    output supply1 id_5
);
  assign id_0 = 1;
  assign id_5 = 1;
  module_0(
      id_2, id_4, id_2, id_1, id_5, id_3, id_4, id_4, id_2
  );
  wire id_7;
  initial begin
    id_0 <= 1'b0;
  end
endmodule
