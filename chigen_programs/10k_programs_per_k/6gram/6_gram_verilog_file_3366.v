// Seed: 4097753639
module module_0 (
    input tri0 id_0,
    output tri id_1,
    input tri0 id_2,
    output supply0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    output wor id_8,
    output supply0 id_9,
    input wand id_10,
    input wand id_11,
    output tri0 id_12,
    input tri0 id_13
);
  supply0 id_15 = 1 ^ 1;
  wand id_16;
  wire id_17;
  assign id_8 = 1;
  wire id_18;
  wire id_19;
  id_20(
      1, {1{id_16}}, 1'b0
  );
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wire id_4
);
  assign id_4 = id_0;
  wire id_6;
  module_0(
      id_2, id_4, id_2, id_4, id_4, id_3, id_3, id_3, id_4, id_4, id_3, id_1, id_4, id_3
  );
  always @(posedge id_0 - 1 or posedge 1'd0) begin
    if (1'b0)
      #1 begin
        disable id_7;
      end
  end
endmodule
