// Seed: 35366626
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
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_3[1] - id_1;
  module_0(
      id_1, id_2, id_2, id_2, id_2, id_2, id_2
  );
endmodule
module module_2 ();
  always @(negedge {
    1,
    1
  } or 1)
  fork : id_1
    @(1);
    id_1 <= 1'b0;
  join
endmodule
module module_3 (
    input  tri1  id_0,
    input  tri0  id_1,
    output wire  id_2,
    input  uwire id_3
);
  always @(posedge 1) deassign id_2;
  module_2();
  assign id_2 = id_3;
  not (id_2, id_3);
endmodule
