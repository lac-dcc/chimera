// Seed: 420371609
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input uwire id_4,
    output wor id_5,
    input tri0 id_6,
    output uwire id_7,
    input uwire id_8,
    output supply0 id_9,
    input tri0 id_10,
    input tri0 id_11,
    input wand id_12,
    output tri id_13
);
  supply0 id_15 = 1;
  supply1 id_16, id_17, id_18;
  id_19 :
  assert property (@(posedge 1) id_16)
  else $display();
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output uwire id_2,
    input wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    output wand id_6,
    output wor id_7,
    input tri1 id_8,
    input wand id_9,
    input tri id_10,
    output supply1 id_11,
    output wand id_12,
    input wand id_13,
    output logic id_14,
    input tri0 id_15,
    input tri id_16
);
  wire id_18;
  always @(posedge id_10 or negedge id_3) begin
    id_14 <= id_1 & 1;
  end
  module_0(
      id_15, id_2, id_0, id_3, id_13, id_12, id_13, id_7, id_1, id_2, id_5, id_15, id_15, id_12
  );
endmodule
