// Seed: 3293274231
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = 1;
  assign id_3#(.id_5(1 - 1)) = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_10(
      .id_0((1 || id_3 <= 1'b0)), .id_1(1)
  ); module_0(
      id_2, id_2, id_5, id_7, id_2, id_3, id_7
  );
  initial begin
    #1;
    if (id_8 && 1) assume (1);
    id_1 = 1;
    if (id_8) id_6 <= 1;
  end
  assign id_6 = id_3 ? 1 : 1 ? id_1 : id_9;
  xor (id_7, id_10, id_2, id_1, id_3, id_9, id_8, id_6);
  assign id_1 = id_3 == 1'b0;
endmodule
