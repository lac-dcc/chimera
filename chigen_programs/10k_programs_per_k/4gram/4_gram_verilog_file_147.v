// Seed: 413314685
module module_0 (
    output supply1 id_0,
    output uwire id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4,
    input tri id_5,
    input supply0 id_6,
    input uwire id_7,
    output tri0 id_8,
    input tri0 id_9,
    output supply0 id_10,
    output wor id_11,
    input tri0 id_12,
    input tri id_13,
    input supply1 id_14
);
  wire id_16;
  assign id_0 = 1;
endmodule
module module_1 (
    output tri   id_0,
    input  wand  id_1,
    input  wire  id_2,
    output uwire id_3,
    output logic id_4
);
  reg id_6;
  module_0(
      id_3, id_0, id_2, id_1, id_2, id_2, id_1, id_2, id_3, id_1, id_3, id_0, id_1, id_1, id_1
  );
  always @* begin
    #1 begin
      id_4 <= 1;
    end
    assume (id_6);
  end
  always @(posedge id_1 or posedge id_2) id_4 <= id_6;
endmodule
