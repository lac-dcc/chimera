// Seed: 2681108169
module module_0;
  wire id_1, id_2, id_3, id_4, id_5, id_6, id_7;
  module_2 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3
  );
  assign module_1.id_1 = 0;
endmodule
program module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input tri0 id_2
);
  module_0 modCall_1 ();
endprogram
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0] id_5 = id_5;
  wire id_6;
  time id_7 (
      .id_0(id_1),
      .id_1(id_3),
      .id_2(id_1 | 1),
      .id_3(1),
      .id_4(id_5[1'b0]++ == id_1)
  );
endmodule
