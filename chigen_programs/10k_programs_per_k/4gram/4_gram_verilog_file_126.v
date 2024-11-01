// Seed: 751110389
module module_0 (
    input  supply1 id_0,
    output logic   id_1,
    input  logic   id_2,
    output uwire   id_3
);
  initial begin
    id_1 <= id_2;
  end
  module_2(); timeunit 1ps;
endmodule
module module_1 (
    input  tri0  id_0,
    output wire  id_1,
    output logic id_2,
    input  logic id_3
);
  always @(posedge 1) if (id_0) id_2 <= id_3;
  module_0(
      id_0, id_2, id_3, id_1
  );
  wire id_5;
endmodule
module module_2;
  logic [7:0] id_1;
  assign id_1[1] = 1;
  wire id_2;
endmodule
