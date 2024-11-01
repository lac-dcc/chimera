// Seed: 543217044
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input wand id_2,
    input tri id_3,
    output supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output wand id_7,
    output uwire id_8,
    input wire id_9,
    input supply0 id_10,
    input uwire id_11,
    input wire id_12,
    output wor id_13
);
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    input tri id_2,
    output supply1 id_3,
    input tri id_4,
    output supply0 id_5,
    output uwire id_6,
    input supply0 id_7,
    output wand id_8
);
  task id_10;
    #1 begin
      if (id_0) begin
        id_10 = 1 - id_7;
      end
    end
  endtask
  module_0(
      id_1, id_0, id_4, id_1, id_8, id_0, id_1, id_5, id_5, id_1, id_1, id_2, id_2, id_8
  );
endmodule
