// Seed: 3454088910
module module_0;
  initial begin
    if (id_1) id_1 <= id_1;
    else assume (id_1);
  end
  assign id_2 = id_2;
  assign id_2[1] = 1'd0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
  wire id_8;
  module_0();
endmodule
module module_2 (
    input supply0 id_0,
    output wand id_1,
    input uwire id_2,
    input tri1 id_3
);
  assign id_1 = 1;
  wire id_5, id_6, id_7;
  integer id_8;
endmodule
module module_3 (
    input supply0 id_0,
    input wor id_1,
    input wand id_2,
    input wand id_3,
    output tri0 id_4,
    output tri0 id_5,
    input wor id_6,
    input tri0 id_7,
    output supply0 id_8
);
  assign id_4 = id_2;
  assign id_4 = id_1;
  tri id_10;
  genvar id_11;
  always @(*) begin
    id_11 <= 1 == {{id_6, id_1}, 1'b0};
    fork
      @(posedge id_2) id_5 = id_3;
      id_12;
    join_none
    if (1)
      case (1)
        id_2 & 1: id_11 <= 1;
        default:  id_10 = {1 + 1{1'b0}} != 1'b0;
      endcase
  end
  xnor (id_8, id_6, id_11, id_7, id_1, id_0, id_10, id_2, id_3);
  module_2(
      id_0, id_5, id_1, id_6
  );
endmodule
