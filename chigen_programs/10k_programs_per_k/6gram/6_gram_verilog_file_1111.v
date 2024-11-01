// Seed: 3763838709
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri id_2,
    output tri1 id_3,
    input tri1 id_4,
    input supply1 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input supply0 id_8,
    output wor id_9
);
  wor  id_11 = 1;
  wire id_12;
  wire id_13;
  wire id_14;
  id_15(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1'b0)
  );
  wire id_16;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1
    , id_13,
    input wand id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    output supply1 id_6,
    output uwire id_7,
    output logic id_8,
    output supply0 id_9,
    input supply0 id_10,
    output logic id_11
);
  initial begin
    if (id_3) begin
      id_11 <= 1;
    end else assume (id_10 < id_1);
    id_8 <= 1;
  end
  module_0(
      id_0, id_5, id_1, id_7, id_2, id_4, id_7, id_10, id_10, id_9
  );
endmodule
