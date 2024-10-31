// Seed: 2173288945
module module_0 (
    output wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wire id_3,
    output supply1 id_4,
    input wor id_5,
    input tri0 id_6
);
  wire id_8;
  wire id_9;
  timeprecision 1ps;
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    output tri id_2,
    input tri1 id_3,
    output logic id_4
);
  id_6(
      .id_0(id_4), .id_1(1), .id_2(id_1#(.id_3(1))), .id_4({1'b0{id_0}}), .id_5(1'b0)
  );
  xnor (id_4, id_3, id_6, id_1, id_0);
  module_0(
      id_2, id_0, id_0, id_1, id_2, id_3, id_3
  );
  initial begin : id_7
    id_4 <= $display;
    wait (id_7);
  end
endmodule
