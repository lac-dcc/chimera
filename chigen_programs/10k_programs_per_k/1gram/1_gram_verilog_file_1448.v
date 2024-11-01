// Seed: 440445285
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wor id_2,
    output tri0 id_3,
    input wand id_4,
    input supply0 id_5,
    input wor id_6,
    input tri id_7,
    output tri0 id_8
);
  assign id_3 = id_6;
  assign id_1 = 1;
  assign id_8 = 1;
  assign id_1 = id_6;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1
);
  assign id_0 = id_1;
  assign id_0 = {1 / id_1{id_1}};
  tri0 id_3, id_4;
  module_0(
      id_3, id_3, id_4, id_3, id_3, id_4, id_3, id_1, id_3
  );
  assign id_4 = 1'b0;
  assign id_0 = id_4;
  id_5 :
  assert property (@(posedge id_3) 1) id_4 = ~1;
  wire id_6, id_7;
  always begin
    id_5 = id_3;
  end
  pulldown (.id_0(id_5), .id_1(id_3));
  assign id_0 = 1;
  assign id_0 = {id_3, 1} & 1;
  wire id_8;
endmodule
