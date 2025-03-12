// Seed: 2218073455
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_6 = 1;
  assign id_5 = id_6[-1];
  struct packed {
    logic [1 : 1 'b0] id_7;
    logic [1 : 1] id_8;
  } id_9;
  ;
  assign id_5 = id_6;
endmodule
module module_1;
  wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  always @(id_1 <= id_2 or 1) force id_2 = id_1;
endmodule
