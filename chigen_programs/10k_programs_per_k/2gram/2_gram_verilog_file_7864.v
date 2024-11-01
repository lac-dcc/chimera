// Seed: 1581677092
module module_0 (
    output logic id_0,
    input supply1 id_1,
    input wor id_2,
    output supply1 id_3,
    input tri0 id_4,
    output logic id_5,
    input wand id_6,
    input wor id_7,
    output wor id_8,
    input uwire id_9,
    input supply1 id_10,
    input tri1 id_11
);
  reg  id_13;
  wire id_14;
  wire id_15;
  assign id_5 = 1;
  always @(posedge 1)
    if (1) begin
      id_5 <= #1 id_13;
      id_0 <= 1;
    end else #id_16 @((1) or posedge 1) assert (1) assign id_15 = id_16;
  wire id_17;
  id_18(
      id_16, 1 - id_9, 1, 1'b0
  );
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    input  wor   id_2,
    output logic id_3,
    output uwire id_4,
    input  tri   id_5
);
  module_0(
      id_3, id_0, id_2, id_4, id_0, id_3, id_5, id_5, id_4, id_5, id_5, id_1
  );
  always id_3 <= 1;
endmodule
