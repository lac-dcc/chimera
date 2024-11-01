// Seed: 1814124304
module module_0 (
    input tri0 id_0
);
  wire id_2;
  wire id_3;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input tri id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wor id_5
    , id_12,
    input supply0 id_6,
    input wand id_7,
    input wand id_8,
    input tri0 id_9,
    output tri0 id_10
);
  reg id_13;
  module_0(
      id_0
  );
  always #1 begin
    fork
      disable id_14;
      id_4 = (id_2 ? 1 : id_7);
    join
    id_13 <= id_3 && id_14 && 1;
  end
  wor id_15 = 1'b0;
  id_16 :
  assert property (@(posedge 1) id_0)
  else $display;
  always @(posedge id_15 >>> 1'b0);
  wire id_17;
  id_18(
      .id_0(id_1), .id_1(id_7)
  );
endmodule
