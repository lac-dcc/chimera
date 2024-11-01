// Seed: 950823034
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri id_2,
    input wand id_3,
    input tri id_4,
    input tri0 id_5,
    output logic id_6
);
  always @(id_5 or posedge id_3) id_6 <= id_5 == 1'b0;
  wire id_8;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    output supply1 id_2,
    input logic id_3,
    output tri0 id_4,
    output wand id_5
);
  wire id_7;
  wire id_8;
  module_0(
      id_1, id_1, id_5, id_1, id_1, id_1, id_0
  );
  always @(negedge id_7) begin
    id_0 <= id_3;
  end
endmodule
