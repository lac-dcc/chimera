// Seed: 317668443
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
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  nand (id_3, id_2, id_4);
  module_0(
      id_3, id_3, id_4, id_3, id_3, id_4, id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  module_0(
      id_8, id_6, id_8, id_8, id_8, id_8, id_2
  );
  wire  id_9;
  wire  id_10;
  wand  id_11;
  uwire id_12;
  always @(posedge (1'd0) or posedge 1) begin
    id_12 = id_11 || 1;
    id_1 <= id_4[1 : 1];
  end
  wire id_13;
endmodule
