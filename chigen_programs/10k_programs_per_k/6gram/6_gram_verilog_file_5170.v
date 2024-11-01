// Seed: 1963999303
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input supply0 id_2,
    output supply0 id_3,
    output wire id_4,
    input tri1 id_5,
    output supply0 id_6,
    output uwire id_7,
    output supply1 id_8,
    output wand id_9
);
  id_11(
      .id_0(1'h0)
  );
  wire id_12;
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input tri id_2,
    output supply1 id_3,
    output supply0 id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    output logic id_8,
    output tri0 id_9
);
  always
  fork : id_11
    id_12(1);
    begin
      assign id_8#("", id_7) = 1;
      id_8 = id_6 == 1;
      id_8 <= #id_0 1 - 1;
    end
  join
  module_0(
      id_0, id_0, id_2, id_5, id_9, id_7, id_5, id_9, id_5, id_9
  );
endmodule
