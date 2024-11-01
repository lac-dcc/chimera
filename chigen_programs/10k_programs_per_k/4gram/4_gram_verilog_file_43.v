// Seed: 1462994155
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input tri id_2,
    input wor id_3,
    output tri id_4,
    input wand id_5,
    input supply1 id_6,
    input uwire id_7,
    input tri0 id_8,
    input tri1 id_9,
    input supply0 id_10,
    input tri0 id_11,
    input tri1 id_12,
    input wire id_13,
    input tri1 id_14
);
  wire id_16;
  assign id_4 = id_12 & 1'h0;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    output wire id_2,
    output logic id_3
    , id_6,
    input wor id_4
);
  module_0(
      id_1, id_0, id_0, id_1, id_2, id_1, id_4, id_4, id_1, id_1, id_4, id_1, id_1, id_1, id_4
  );
  always @(posedge id_1 or posedge id_0) begin
    assign id_3 = id_6;
  end
  always @(posedge id_1) id_3 = id_6;
endmodule
