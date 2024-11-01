// Seed: 1276284716
module module_0 (
    input wire id_0,
    input tri0 id_1,
    output tri0 id_2,
    input wire id_3,
    input wor id_4,
    input wire id_5,
    input tri1 id_6,
    output supply0 id_7,
    input tri1 id_8,
    input wor id_9,
    output tri0 id_10,
    input uwire id_11,
    input supply1 id_12,
    input tri id_13,
    output tri0 id_14,
    input tri id_15,
    input wor id_16,
    input wand id_17,
    output wand id_18,
    output supply1 id_19
);
  assign id_7 = 1;
  wire id_21;
  tri0 id_22 = id_1;
  always @* begin
    id_10 = id_13;
  end
endmodule
module module_1 (
    input tri id_0,
    output wand id_1,
    input wire id_2,
    input uwire id_3,
    input uwire id_4,
    input tri1 id_5,
    output wor id_6,
    input tri0 id_7,
    output uwire id_8,
    output uwire id_9,
    output wand id_10,
    output supply1 id_11,
    input supply1 id_12,
    input tri id_13,
    output uwire id_14
);
  wire id_16;
  module_0(
      id_5,
      id_5,
      id_14,
      id_5,
      id_5,
      id_3,
      id_5,
      id_9,
      id_0,
      id_3,
      id_14,
      id_0,
      id_7,
      id_13,
      id_1,
      id_3,
      id_0,
      id_3,
      id_8,
      id_1
  );
  always
  fork : id_17
    #1;
    repeat (id_17) @(posedge id_7);
  join : id_18
endmodule
