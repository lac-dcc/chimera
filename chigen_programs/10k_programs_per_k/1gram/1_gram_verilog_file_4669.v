// Seed: 1797078644
module module_0 (
    input wor  id_0,
    input tri  id_1,
    input tri  id_2,
    input tri0 id_3,
    input tri  id_4,
    input tri1 id_5
);
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input wor id_2,
    output wire id_3,
    output uwire id_4,
    input supply0 id_5,
    input logic id_6,
    input wand id_7,
    input wor id_8,
    input supply0 id_9,
    output uwire id_10,
    output supply0 id_11,
    output tri id_12,
    output logic id_13,
    input logic id_14
);
  module_0(
      id_8, id_2, id_9, id_5, id_9, id_2
  );
  always
    repeat (id_8) begin
      begin
        id_13 = id_6;
        id_13 <= 1;
        id_11 = id_9;
        id_11 = 1;
        id_13 <= {1{id_6}};
        #id_16;
        if (id_2) id_16 <= id_14;
      end
    end
  assign id_1  = 1;
  assign id_12 = id_9;
endmodule
