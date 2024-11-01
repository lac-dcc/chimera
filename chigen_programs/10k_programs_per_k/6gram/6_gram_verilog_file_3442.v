// Seed: 1178171050
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    module_0,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_13(
      .id_0(), .id_1(id_2)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always #1
    if (id_5) begin
      #1;
      id_4 <= id_4 == id_2;
      #1;
      if (id_4) id_6 = 1;
    end else if (1'b0) id_3 <= id_1;
    else id_4 <= #id_5 1;
  wand id_7, id_8;
  assign id_8 = 1'b0;
  assign id_4 = 1;
  initial assume (1'd0);
  module_0(
      id_8, id_6, id_7, id_8, id_7, id_5, id_2, id_7, id_7, id_7, id_5, id_8
  );
endmodule
