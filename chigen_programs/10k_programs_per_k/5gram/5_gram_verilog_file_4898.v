// Seed: 428013416
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wor id_4,
    output wand id_5,
    output uwire id_6,
    input supply1 id_7,
    output wand id_8,
    output wire id_9,
    output tri0 id_10,
    input wand id_11,
    output wand id_12,
    input tri0 id_13,
    output tri0 id_14,
    input supply1 id_15,
    input tri0 id_16,
    output tri0 id_17,
    output wire id_18,
    input supply0 id_19,
    output wand id_20,
    input wire id_21,
    output supply0 id_22,
    output tri1 id_23,
    input uwire id_24
);
  wire id_26;
  wire id_27;
endmodule
module module_1 (
    output tri0 id_0,
    input wor id_1,
    input wand id_2,
    input tri0 id_3,
    inout tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input tri id_7,
    input tri0 id_8,
    output tri id_9,
    output logic id_10,
    output supply1 id_11,
    input uwire id_12
);
  always @(posedge id_1 or negedge id_3) begin
    begin
      id_4 = id_3;
      fork
        begin
          id_10 <= 1;
        end
      join
      #1 #1;
    end
    id_0 += 1'b0;
    assign id_10 = 1;
  end
  module_0(
      id_11,
      id_11,
      id_8,
      id_4,
      id_2,
      id_9,
      id_9,
      id_12,
      id_11,
      id_9,
      id_11,
      id_1,
      id_0,
      id_8,
      id_4,
      id_12,
      id_7,
      id_9,
      id_11,
      id_2,
      id_9,
      id_1,
      id_0,
      id_0,
      id_2
  );
endmodule
