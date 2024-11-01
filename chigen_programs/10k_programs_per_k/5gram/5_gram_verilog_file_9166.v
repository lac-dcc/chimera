// Seed: 2411970082
module module_0;
  if (id_1) assign id_1 = 1;
  else wand id_2 = 1;
endmodule
module module_1 (
    input  logic   id_0,
    input  logic   id_1,
    output logic   id_2,
    input  supply1 id_3,
    input  logic   id_4
);
  always @(posedge id_0 or negedge id_4) begin
    id_2 <= 1;
    id_2 <= (id_1);
    fork
      id_2 <= id_4;
      #(1);
    join_any
  end
  wire id_6;
  wire id_7;
  module_0();
endmodule
module module_2;
  module_0();
  assign id_1 = 1;
endmodule
