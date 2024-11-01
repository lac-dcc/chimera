// Seed: 2781372138
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
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_15 :
  assert property (@(posedge id_15) 1'b0 == id_11)
  else $display();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  and (id_1, id_7, id_4, id_6);
  integer id_7 = 1;
  assign id_3 = 1;
  module_0(
      id_4, id_6, id_7, id_1, id_6, id_1, id_2, id_1, id_1, id_6, id_4, id_1, id_7, id_1
  );
endmodule
