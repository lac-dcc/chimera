// Seed: 2680042970
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    input wor id_3,
    output tri id_4,
    output tri1 id_5,
    input supply0 id_6,
    input wand id_7
    , id_10,
    output uwire id_8
);
  wire id_11;
  supply1 id_12 = 1;
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    input supply0 id_2,
    input tri0 id_3,
    output uwire id_4,
    output tri id_5,
    input supply1 id_6,
    input tri0 id_7,
    input supply0 id_8,
    input uwire id_9,
    input logic id_10,
    input wire id_11,
    output logic id_12,
    output logic id_13
    , id_16,
    input wor id_14
);
  uwire id_17 = id_11;
  wire  id_18;
  assign id_17 = {id_11{1}};
  always @(posedge id_16 or posedge id_18) begin
    id_13 <= (id_10);
  end
  module_0(
      id_7, id_17, id_4, id_2, id_4, id_17, id_6, id_7, id_1
  );
  always @(*) id_12 = #1 1;
endmodule
