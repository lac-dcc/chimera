// Seed: 2749302470
module module_0 (
    input wand id_0,
    input wand id_1,
    input wand id_2,
    input supply0 id_3,
    output supply1 id_4
);
  union packed {
    struct packed {
      logic id_6;
      logic id_7;
      logic id_8;
    } id_9 = 1;
  } id_10;
  wire id_11;
  assign id_11 = id_10.id_8;
  assign id_10.id_9 = 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1,
    output wire  id_2,
    output logic id_3
);
  always @(id_0 or negedge id_0)
    #1
      @(posedge -1'b0)
        if (1 * -1 == -1) id_3 <= 1 ^ -1 ? 1 : id_0;
        else id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
endmodule
