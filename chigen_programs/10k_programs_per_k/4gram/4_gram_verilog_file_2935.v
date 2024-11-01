// Seed: 3980522398
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
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
  wire id_13 = id_12;
  id_14 :
  assert property (@(posedge 1) id_5)
  else $display(1'h0);
  assign id_11 = 1 ? 1 : id_3;
  assign id_7  = id_3;
  id_15(
      .id_0(id_9 == id_10), .id_1(1), .id_2(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10;
  tri0 id_11 = 1;
  module_0(
      id_2, id_7, id_10, id_7, id_7, id_10, id_11, id_6, id_11, id_11, id_11
  );
  initial begin
    if (id_9[1]) $display;
    else id_5 <= id_4;
  end
  wire id_12;
  genvar id_13;
  wand id_14 = 1;
  genvar id_15;
endmodule
