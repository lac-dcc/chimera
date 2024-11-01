// Seed: 821780874
macromodule module_0 (
    input tri0 id_0,
    output supply1 id_1,
    output tri id_2,
    input wor id_3,
    input tri1 id_4,
    input supply0 id_5,
    input tri0 id_6
);
  wire id_8;
endmodule
module module_1 (
    output tri   id_0,
    input  wire  id_1,
    output uwire id_2,
    output uwire id_3
);
  module_0(
      id_1, id_2, id_3, id_1, id_1, id_1, id_1
  );
  tri0 id_5;
  always_latch
  fork
    if (1) id_5 = id_1;
  join_any
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(negedge 1) begin
    id_1 <= 1'b0;
    id_1 <= id_2;
  end
  wire id_4 = id_3;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2[1 : 1] = id_4;
  assign id_4 = 1;
  module_2(
      id_7, id_6, id_5
  ); id_9(
      .id_0(1), .id_1(1'd0), .id_2(1), .id_3(id_3)
  );
  nor (id_6, id_5, id_7, id_4, id_1, id_8);
  reg id_10;
  initial begin
    id_6  <= id_10;
    id_10 <= 1;
  end
  initial begin
    id_1 = id_5;
    if (id_4)
      if (id_4(1 & id_6)) id_1 = 1;
      else assert (1);
    #1 begin
      id_4 <= $display(id_10, id_10);
    end
    id_3  <= id_10;
    id_10 <= 1;
    disable id_11;
    id_7 <= id_11;
  end
  wire id_12;
  wire id_13;
endmodule
