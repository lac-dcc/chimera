// Seed: 3416200025
module module_0 (
    output logic id_0,
    input logic id_1,
    input tri id_2,
    input wor id_3,
    input uwire id_4,
    input tri id_5,
    input uwire id_6,
    input logic id_7,
    input wand id_8,
    input wor id_9,
    input wire id_10,
    output logic id_11,
    output logic id_12,
    input tri0 id_13,
    input supply0 id_14,
    output uwire id_15,
    output wire id_16,
    output logic id_17,
    input tri0 id_18,
    output tri0 id_19,
    input wand id_20,
    output supply0 id_21,
    output wand id_22,
    input tri id_23,
    input tri1 id_24,
    output supply0 id_25,
    output logic id_26
);
  always @(*) begin
    fork
      #(id_6);
      repeat (id_18) begin
        id_0 <= id_1;
        id_26 = |id_2;
      end
    join
    id_11 <= 1;
    if (1) begin
      begin
        id_17 <= id_7;
        begin
          id_12 <= 1'h0;
          id_26 <= 1;
        end
      end
    end
  end
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output wor id_2,
    input logic id_3,
    output tri1 id_4,
    input wor id_5,
    output supply1 id_6,
    output logic id_7
);
  always @(posedge 1'h0) id_7 = #1 id_3;
  module_0(
      id_7,
      id_3,
      id_5,
      id_0,
      id_0,
      id_1,
      id_5,
      id_3,
      id_0,
      id_0,
      id_0,
      id_7,
      id_7,
      id_1,
      id_1,
      id_2,
      id_6,
      id_7,
      id_5,
      id_6,
      id_0,
      id_6,
      id_4,
      id_1,
      id_0,
      id_2,
      id_7
  );
endmodule
