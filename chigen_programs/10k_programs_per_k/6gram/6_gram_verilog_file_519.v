// Seed: 960752151
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = id_5[1 : 1];
  wire id_6;
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 1;
  always @(negedge id_3 or posedge 1) id_3 = #1 id_6;
  wand id_9 = id_3 !== 1;
  assign id_4 = id_7;
  module_0(
      id_4, id_2, id_2, id_9
  );
  always @(1 > id_8 or id_9) force id_1 = 1;
endmodule
