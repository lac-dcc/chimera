// Seed: 3890310410
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output wor id_3,
    input wand id_4,
    output tri0 id_5,
    output tri id_6,
    input supply1 id_7,
    input tri0 id_8,
    input uwire id_9,
    output tri id_10,
    input supply0 id_11,
    input uwire id_12,
    input supply0 id_13,
    input wor id_14,
    input wand id_15,
    input tri id_16
    , id_28,
    input supply1 id_17,
    input tri0 id_18,
    output wor id_19,
    output tri1 id_20
    , id_29,
    input supply0 id_21,
    input tri0 id_22,
    input wand id_23,
    input wire id_24,
    input wire id_25,
    output tri0 id_26
);
  assign id_5 = id_9;
  tri1 id_30 = 1;
  wire id_31;
  id_32(
      1, id_10
  ); id_33(
      id_16, 1, id_5, !id_20
  );
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    output tri id_3,
    output wire id_4,
    output logic id_5,
    output uwire id_6,
    input tri0 id_7,
    input logic id_8,
    input tri0 id_9,
    output logic id_10,
    output wand id_11,
    input tri1 id_12,
    input wand id_13,
    output logic id_14,
    input tri0 id_15,
    input wand id_16
);
  always_latch @(posedge 1 | 1 or posedge id_12) begin
    id_4 = 1 == 1 & id_16;
    if (id_2) id_5 <= id_8;
    if (id_13) begin
      if ((1))
        #(1) begin
          id_14 <= id_1 >= id_16;
        end
      else begin
        id_10 <= 1'b0 - id_8;
      end
    end
  end
  module_0(
      id_6,
      id_11,
      id_13,
      id_0,
      id_1,
      id_4,
      id_0,
      id_12,
      id_16,
      id_7,
      id_4,
      id_9,
      id_12,
      id_12,
      id_1,
      id_12,
      id_2,
      id_7,
      id_15,
      id_4,
      id_3,
      id_7,
      id_15,
      id_12,
      id_2,
      id_15,
      id_11
  );
endmodule
