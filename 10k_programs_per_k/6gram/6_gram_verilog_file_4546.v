// Seed: 1138648690
primitive id_0(id_3, id_1, id_2, id_2);
  reg id_4;
  reg id_5;
  table
    0 ? 0 1 x x : 1;
    0 1 ? 0 x 1 : 1;
    1 ? x : 0;
    ? 0 0 : 0;
    ? ? 1 1 0 0 : 1;
    ? 1 1 1 ? 0 : 1;
    1 0 1 : 1;
  endtable
endprimitive
module module_0 (
    output id_0,
    output id_1,
    input  id_2,
    output id_3
);
  assign id_0[1] = id_2;
  logic id_4, id_5;
  logic id_6 = id_6;
  always #0 id_3 <= 1;
endmodule
