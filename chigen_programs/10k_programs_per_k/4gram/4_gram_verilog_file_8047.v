// Seed: 2544347395
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  id_8(
      .id_0(id_2), .id_1((1)), .id_2()
  );
  integer id_9 = 1, id_10;
  wire id_11;
  id_12 :
  assert property (@(posedge 1) 1)
  else $display(1);
  assign id_10 = id_3;
  wire id_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(negedge id_4)
    if (id_4) id_3 <= #1 id_5;
    else id_2 <= 1;
  module_0(
      id_4, id_4, id_4, id_1, id_6, id_4
  );
endmodule
