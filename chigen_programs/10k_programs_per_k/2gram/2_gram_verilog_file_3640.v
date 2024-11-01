// Seed: 1979000363
module module_0 (
    input tri1 id_0,
    input wor  id_1
);
  wire id_3;
  wire id_4;
  module_2(
      id_3, id_3, id_4
  );
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input uwire id_2,
    input tri id_3,
    input tri id_4,
    input supply1 id_5,
    output wire id_6,
    input wire id_7,
    input supply0 id_8,
    input wor id_9,
    output wor id_10,
    input uwire id_11
    , id_13
);
  wire id_14;
  module_0(
      id_8, id_4
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  supply1 id_4;
  wor id_5;
  tri1 id_6;
  id_7(
      1, 1, 1'b0
  );
  wor id_8;
  id_9 :
  assert property (@(posedge 1 or negedge id_6) id_8)
  else;
  wire id_10;
  if (id_4 <-> id_8) begin
    assign id_1 = 1'd0;
  end else wire id_11;
  assign id_5 = 1;
  assign id_8 = id_9;
  wire id_12;
  assign id_11 = 1 & id_4;
endmodule
