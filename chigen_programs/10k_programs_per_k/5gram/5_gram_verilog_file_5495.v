// Seed: 541839256
module module_0 (
    output tri id_0,
    output tri1 id_1,
    input wor id_2,
    output wand id_3,
    input supply1 id_4,
    output wand id_5
);
  assign id_5 = 1;
  module_2(
      id_3, id_4, id_2
  );
  assign id_3 = id_4;
endmodule
module module_1 (
    output tri id_0,
    output tri1 id_1,
    input supply1 id_2
);
  assign id_1 = 1'b0;
  module_0(
      id_0, id_1, id_2, id_0, id_2, id_1
  );
  final $display(1, "", id_2 - 1);
  specify
    $width(id_4, id_2);
  endspecify
endmodule
module module_2 (
    output supply1 id_0,
    input wire id_1,
    input tri1 id_2
);
  always_latch @(posedge id_2 !== id_1 or posedge id_2) #1;
  tri id_4;
  supply1 id_5 = id_4 == id_2;
  wor id_6 = id_5;
  wire id_7 = id_7, id_8;
  wire id_9;
  wire id_10;
endmodule
