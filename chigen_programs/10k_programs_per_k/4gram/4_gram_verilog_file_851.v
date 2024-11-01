// Seed: 1313305753
module module_0 (
    input tri id_0,
    input wand id_1,
    output tri1 id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply1 id_7
);
  wand id_9;
  always @(1 or posedge ({1{id_5}})) begin
    fork
      id_9 = 1;
      id_10(1);
    join
  end
  final $display(1'b0);
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    output wire id_2,
    output supply0 id_3,
    output uwire id_4,
    output tri0 id_5,
    output wand id_6,
    input tri0 id_7,
    output wor id_8,
    input wand id_9
);
  integer id_11 (
      .id_0 (~id_8),
      .id_1 (id_1),
      .id_2 (id_0),
      .id_3 (id_6),
      .id_4 (!id_6),
      .id_5 (1 + id_8),
      .id_6 (id_7),
      .id_7 (id_9),
      .id_8 ({id_8{1'b0 & id_8 & id_8 & id_6}}),
      .id_9 (1'd0),
      .id_10(id_9),
      .id_11($display),
      .id_12(!id_2)
  );
  module_0(
      id_0, id_7, id_1, id_9, id_8, id_9, id_0, id_0
  );
endmodule
