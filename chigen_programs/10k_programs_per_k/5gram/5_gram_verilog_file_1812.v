// Seed: 1611622794
module module_0 (
    input wand id_0
    , id_14,
    input tri1 id_1,
    output tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 module_0,
    input wand id_7,
    input wand id_8,
    input uwire id_9,
    input tri1 id_10
    , id_15,
    output wire id_11,
    input tri1 id_12
);
  supply1 id_16 = id_7;
  assign id_2 = {(id_7), id_8 !=? 1};
endmodule
module module_1 (
    input  logic id_0,
    output uwire id_1,
    input  logic id_2,
    output logic id_3
    , id_6,
    input  wor   id_4
);
  always @(posedge id_2 or id_0) begin
    id_3 <= id_0;
  end
  id_7(
      .id_0(1), .id_1(1'b0 & id_6 != 1)
  ); module_0(
      id_4, id_4, id_1, id_1, id_4, id_4, id_4, id_4, id_4, id_4, id_4, id_1, id_4
  );
  wire id_8;
  wire id_9;
endmodule
