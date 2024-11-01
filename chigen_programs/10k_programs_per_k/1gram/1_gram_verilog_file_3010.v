// Seed: 3765225769
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    output wire id_3,
    input uwire id_4,
    output uwire id_5,
    input wor id_6,
    output wand id_7,
    input supply1 id_8,
    input tri1 id_9,
    input wire id_10
);
  id_12 :
  assert property (@* id_6) begin
    `define pp_13 0
    @(posedge id_0)
    if (`pp_13) $display;
    else id_12 = ~1;
  end : id_14
  wire id_15 = 1, id_16, id_17;
  tri  id_18 = id_10;
  wire id_19;
endmodule
module module_1 (
    input supply0 id_0,
    output wire id_1,
    input tri1 id_2,
    output logic id_3
);
  wand id_5 = 1;
  final id_3 <= 1;
  id_6(
      "", 1
  ); module_0(
      id_2, id_0, id_2, id_1, id_0, id_1, id_2, id_1, id_2, id_0, id_0
  );
endmodule
