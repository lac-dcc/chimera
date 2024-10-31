// Seed: 3586413113
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input tri id_2,
    input wor id_3,
    input uwire id_4#(
        .id_7(id_7 | id_3 && id_1),
        .id_8({id_4, 1'b0} - id_1)
    ),
    input uwire id_5
);
  assign id_7 = 1;
  id_9(
      1, 1'b0, 1 & id_1 + 1
  );
  assign id_7 = id_4;
  wire id_10;
  assign id_8 = id_0;
  assign id_9 = 1;
  wire id_11;
endmodule
module module_1 (
    output tri0 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wor id_3,
    output logic id_4,
    output wor id_5,
    input tri0 id_6
);
  always begin
    begin
      id_0 = !id_2;
      id_4 <= 1'b0;
      id_4 = 1;
    end
  end
  module_0(
      id_3, id_2, id_6, id_2, id_3, id_3
  );
endmodule
