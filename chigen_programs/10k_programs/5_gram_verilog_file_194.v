// Seed: 1851566806
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    input wor id_8,
    input tri1 id_9,
    input supply0 id_10,
    input wire id_11,
    output tri0 id_12
);
  wire id_14;
  tri1 id_15, id_16 = id_9;
  wire id_17;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    input logic id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input tri id_8,
    input wor id_9,
    output logic id_10
);
  reg id_12;
  always @(posedge 1)
    if (1)
      if (1) begin
        if (1) begin
          id_10 <= 1;
        end else begin
          id_1 = new[1'b0] (1'b0 << 1 + !id_12);
          id_10 <= id_6 == 1'b0;
          id_10 = id_2;
          id_12 <= 1;
        end
      end
  nand (id_1, id_3, id_2, id_12, id_6, id_9, id_8, id_7, id_4);
  module_0(
      id_5, id_4, id_8, id_5, id_0, id_5, id_5, id_7, id_6, id_8, id_9, id_6, id_0
  );
endmodule
