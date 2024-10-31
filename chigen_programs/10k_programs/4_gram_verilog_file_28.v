// Seed: 4196178266
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
    id_11
);
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = ~id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  module_0(
      id_8, id_5, id_5, id_4, id_4, id_7, id_8, id_4, id_4, id_4, id_4
  );
  assign id_6[1] = 1;
  id_9 :
  assert property (@(posedge ~id_7) 1'b0)
  else $display(1);
endmodule
