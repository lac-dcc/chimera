// Seed: 1635021515
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    output wor id_4,
    input wire id_5,
    input wand id_6,
    output logic id_7,
    output supply0 id_8,
    input supply1 id_9,
    input tri id_10,
    input wor id_11,
    input tri1 id_12
);
  always @* begin
    if (id_1) begin
      id_8 = id_0;
    end else id_7 <= 1;
    @(*);
  end
  wire id_14;
  wire id_15;
  tri  id_16 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input logic id_2,
    output logic id_3,
    input wire id_4,
    input wire id_5,
    input logic id_6,
    input tri id_7,
    output supply0 id_8
);
  wire id_10;
  always @(~"" or posedge {1, id_6, id_2 ? 1'd0 : id_2, 1}) id_3 = #id_11 id_6;
  module_0(
      id_7, id_5, id_0, id_7, id_8, id_1, id_7, id_3, id_0, id_5, id_1, id_7, id_5
  );
endmodule
