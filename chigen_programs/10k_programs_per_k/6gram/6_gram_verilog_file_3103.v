// Seed: 1403173440
module module_0 (
    input wire id_0,
    input tri0 id_1,
    input wire id_2,
    input supply0 id_3
    , id_18,
    input tri id_4,
    input supply1 id_5,
    input tri0 id_6
    , id_19,
    input tri1 id_7,
    input wand id_8,
    output supply0 id_9,
    output uwire id_10,
    output supply1 id_11,
    input supply0 id_12,
    input wor id_13
    , id_20,
    output wire id_14,
    input wor id_15,
    input wor id_16
);
  wire id_21;
  assign id_11 = id_0;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1,
    input tri0 id_2,
    output tri id_3,
    input supply0 id_4,
    output logic id_5,
    input tri id_6,
    output supply0 id_7,
    output tri1 id_8,
    output wire id_9,
    input supply1 id_10,
    input tri1 id_11,
    input wire id_12,
    output wire id_13
);
  always @(*) begin
    fork
      begin
        id_5 <= 1'h0;
        id_7 = id_12;
      end
    join
  end
  module_0(
      id_6,
      id_10,
      id_6,
      id_12,
      id_0,
      id_11,
      id_6,
      id_12,
      id_4,
      id_3,
      id_13,
      id_3,
      id_4,
      id_1,
      id_9,
      id_4,
      id_6
  );
endmodule
