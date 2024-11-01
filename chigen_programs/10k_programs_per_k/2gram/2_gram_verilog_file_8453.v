// Seed: 3222148091
macromodule module_0 (
    input supply0 id_0,
    input wand id_1,
    input supply0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output tri0 id_5,
    output tri id_6,
    input uwire id_7,
    output supply0 id_8
);
  id_10 :
  assert property (@(posedge {id_10{id_0}} <-> id_1 or posedge id_4) 1'b0)
  else if (id_7) begin
    id_8 = id_2;
  end
  wire id_11, id_12, id_13;
  tri  id_14 = id_1;
  wire id_15;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wand id_6,
    output uwire id_7,
    output tri id_8,
    input wand id_9,
    output wire id_10,
    input supply0 id_11
);
  module_0(
      id_5, id_4, id_9, id_8, id_6, id_7, id_8, id_9, id_10
  );
  wire id_13;
endmodule
