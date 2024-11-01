// Seed: 631003422
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wor id_3,
    input supply0 id_4,
    output supply0 id_5,
    output tri1 id_6,
    output wand id_7,
    output wand id_8,
    output wire id_9,
    input wor id_10,
    output supply0 id_11
);
  always @(id_3) begin
    id_6 = id_3;
  end
  wire id_13;
  wire id_14;
  always @(posedge 1'b0) begin
    id_7 = 1;
  end
  assign id_5 = id_10;
  wire id_15;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wand id_1,
    output wire id_2,
    input  wand id_3,
    input  wire id_4,
    output tri0 id_5,
    output tri0 id_6
);
  id_8(
      .id_0(id_4), .id_1(1 == 1)
  ); module_0(
      id_2, id_0, id_4, id_0, id_3, id_6, id_5, id_6, id_6, id_5, id_0, id_5
  );
endmodule
