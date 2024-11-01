// Seed: 1938524940
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  supply0 id_15;
  assign id_13 = 1'd0;
  assign #id_16 id_15 = id_7 ? id_8 : 1;
  id_17(
      .id_0(1), .id_1(1), .id_2(1'b0 == id_14 | 1 == 1'd0)
  );
endmodule
module module_1 (
    output tri1 id_0,
    output tri  id_1,
    input  wire id_2,
    input  wor  id_3,
    output wire id_4,
    output wire id_5,
    input  tri1 id_6
);
  wire id_8;
  module_0(
      id_8, id_8, id_8, id_8, id_8, id_8, id_8, id_8, id_8, id_8, id_8, id_8, id_8, id_8
  );
  assign id_5 = id_3;
  always_comb
  fork
    assert (id_6.id_6);
    begin
      id_4 = id_6;
    end
  join : id_9
endmodule
