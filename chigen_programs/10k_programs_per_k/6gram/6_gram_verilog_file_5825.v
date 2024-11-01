// Seed: 3719874104
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input supply1 id_3
    , id_9,
    input tri0 id_4
    , id_10,
    output tri1 id_5,
    output tri0 id_6,
    output wire id_7
);
  assign id_9[1] = 1;
  assign id_6 = 1'b0;
  wire id_11;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output uwire id_2,
    output wire id_3,
    input wor id_4,
    input supply1 id_5,
    input wor id_6,
    output tri0 id_7,
    input logic id_8,
    output logic id_9,
    input wire id_10,
    input wand id_11
);
  always @(posedge 1 or posedge 1 - id_1)
    if (id_5) begin
      module_1 = id_1;
      id_9 <= {id_8{1}};
    end
  module_0(
      id_2, id_4, id_4, id_5, id_6, id_7, id_3, id_7
  );
  reg id_13;
  xor (id_7, id_8, id_10, id_0, id_4, id_6, id_1, id_5, id_11);
  assign id_7 = ~id_4;
  always @(id_10 or posedge 1) begin
    id_13 <= id_13;
  end
endmodule
