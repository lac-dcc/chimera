// Seed: 1981639452
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4 = id_2;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_5;
  wire id_6;
  assign id_5[1] = 1 && 0 == 1;
  wire id_7 = id_6;
  wire id_8;
  module_0(
      id_3, id_6, id_6
  );
  wire id_9;
  wire id_10;
  always @("" or posedge 1) begin
    fork
      #1 $display;
      #1;
    join
  end
endmodule
