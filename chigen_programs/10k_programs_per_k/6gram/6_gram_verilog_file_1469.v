// Seed: 712442111
module module_0 (
    output tri  id_0,
    input  tri0 id_1
);
  assign id_0 = ~id_1;
  assign id_0 = -1 < 1 ? $realtime : id_1 ? 1 : -1;
  pmos #(-1) (-1, id_0, (id_0));
endmodule
module module_1 (
    output uwire id_0,
    output logic id_1,
    output wire  id_2,
    output logic id_3,
    input  tri0  id_4,
    input  tri   id_5,
    input  wand  id_6
);
  localparam id_8 = 1;
  always
    case (-1)
      id_5: id_1 <= id_4;
      1: if (-1'b0) assign id_1 = id_4 != id_6;
      1: id_3 = -1'h0;
      default: id_3 = -1;
    endcase
  assign id_0 = id_6 ? id_4 : id_5;
  logic id_9 = 1;
  reg   id_10;
  logic id_11;
  ;
  assign id_1 = id_9;
  always @(posedge -1'b0) id_9 = -1;
  module_0 modCall_1 (
      id_0,
      id_6
  );
  assign modCall_1.id_1 = 0;
  always id_10 = #1 1;
  wire id_12;
  wire id_13;
endmodule
