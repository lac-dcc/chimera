// Seed: 3075436064
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
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1;
  wire id_11, id_12;
  `define pp_13 0
  wire id_14 = `pp_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1 or posedge 1) begin
    fork
      #1;
      id_6.id_7.id_8;
    join
  end
  wire id_9;
  module_0(
      id_3, id_9, id_3, id_2, id_3, id_4, id_9, id_9, id_3, id_9
  );
endmodule
