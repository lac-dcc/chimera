// Seed: 4263456135
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input tri id_2
);
  reg id_4;
  always_latch id_4 <= id_2;
  initial id_4 = 1;
  assign id_4 = 1'b0;
  assign module_1.id_3 = 0;
  wire id_5;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input tri id_2,
    input wire id_3,
    input wire id_4,
    output tri1 id_5,
    input supply1 id_6,
    input supply0 id_7
);
  assign id_5 = id_4;
  logic id_9;
  assign id_5 = id_6;
  logic id_10;
  ;
  xor primCall (id_5, id_3, id_10, id_6, id_9, id_2);
  assign id_0 = 'b0;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4
  );
endmodule
