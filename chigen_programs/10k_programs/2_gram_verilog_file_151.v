// Seed: 2207075247
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wire id_2,
    input tri id_3,
    input tri1 id_4,
    output wor id_5,
    input tri id_6,
    output supply1 id_7,
    output wand id_8,
    output wand id_9,
    input tri id_10
);
endmodule
module module_1 (
    input logic id_0,
    output wor id_1,
    input uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    output logic id_6,
    input wor id_7
);
  assign id_6 = 1;
  module_0(
      id_2, id_5, id_1, id_5, id_3, id_1, id_5, id_1, id_1, id_1, id_3
  );
  assign id_1 = id_2;
  wire  id_9;
  logic id_10;
  always_ff @(negedge 1'b0 or id_2 or posedge id_5)
    #1 begin
      id_10 <= id_0;
      if (1) id_10 <= id_10;
      else begin
        id_6 = id_10;
      end
    end
endmodule
