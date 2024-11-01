// Seed: 1305104405
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input wor id_2,
    input tri0 id_3,
    inout tri0 id_4,
    output wire id_5,
    input wand id_6,
    input supply1 id_7,
    output tri0 id_8,
    output wand id_9,
    output wor id_10,
    output tri0 id_11,
    input wire id_12,
    input supply0 id_13,
    output tri id_14,
    input tri1 id_15,
    input uwire id_16,
    input tri0 id_17,
    output supply0 id_18,
    input supply1 id_19,
    input tri1 id_20,
    output wor id_21
);
  wire id_23;
  wand id_24 = 1'b0;
  id_25(
      id_24, 1, id_13 & id_8, id_9
  );
  wire id_26;
  assign id_4 = 1;
endmodule
module module_1 (
    input wand id_0,
    output wor id_1,
    input supply1 id_2,
    output uwire id_3,
    output logic id_4,
    input wor id_5,
    input wire id_6
);
  assign id_3 = id_6;
  supply0 id_8;
  wire id_9;
  assign id_3 = id_0;
  initial @(posedge id_0, posedge id_8 or posedge id_0) id_3 = id_5;
  module_0(
      id_0,
      id_2,
      id_0,
      id_0,
      id_8,
      id_3,
      id_6,
      id_6,
      id_3,
      id_8,
      id_1,
      id_8,
      id_5,
      id_6,
      id_3,
      id_0,
      id_2,
      id_6,
      id_1,
      id_5,
      id_2,
      id_1
  );
  final begin
    id_4 <= 1'b0;
  end
  integer id_10;
endmodule
