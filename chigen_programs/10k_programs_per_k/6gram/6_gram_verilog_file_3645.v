// Seed: 2156166886
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri id_5,
    output tri1 id_6
);
  assign id_5 = 1;
  supply0 id_8;
  wire id_9;
  assign id_8 = 1;
  wire id_10 = id_10;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    output tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    output supply1 id_6,
    output logic id_7
);
  always @(id_4 or id_2)
    if (id_1)
      #1 begin
        id_7 <= 1 == id_1;
      end
    else begin
      id_7 = (1);
    end
  module_0(
      id_2, id_0, id_4, id_0, id_0, id_6, id_5
  );
endmodule
