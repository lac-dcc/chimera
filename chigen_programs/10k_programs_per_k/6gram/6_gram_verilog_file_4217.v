// Seed: 2523219619
module module_0;
  initial begin
    $display(id_1);
    fork
      id_2(id_1, 1);
    join
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  wire id_4;
  module_0();
  reg  id_5;
  tri0 id_6;
  always begin
    if (id_6) id_5 <= 1;
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  initial
  fork : id_4
  join : id_5
  module_0();
endmodule
