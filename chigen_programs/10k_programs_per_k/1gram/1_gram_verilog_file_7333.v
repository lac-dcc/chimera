// Seed: 3341921290
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output tri1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input tri id_8,
    output tri id_9,
    input uwire id_10,
    input uwire id_11,
    output wire id_12,
    input supply1 id_13,
    input supply1 id_14,
    output supply0 id_15,
    input supply0 id_16,
    input wire id_17,
    input wire id_18
);
  wire id_20;
  assign id_15 = id_14 > id_16;
  assign id_2  = id_11;
  assign id_2  = id_3;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1
    , id_10,
    output logic id_2,
    input wand id_3,
    output supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    input supply1 id_7,
    output tri id_8
);
  id_11(
      id_10, id_1, 1
  ); module_0(
      id_0,
      id_6,
      id_4,
      id_6,
      id_6,
      id_8,
      id_10,
      id_7,
      id_0,
      id_10,
      id_10,
      id_7,
      id_8,
      id_0,
      id_3,
      id_8,
      id_10,
      id_6,
      id_3
  );
  assign id_4 = id_7;
  initial
    assume (id_0)
    else if (1'b0) begin
      id_2 <= 1'b0 & id_10;
    end
endmodule
