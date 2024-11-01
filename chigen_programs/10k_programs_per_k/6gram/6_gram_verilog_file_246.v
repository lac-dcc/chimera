// Seed: 4047224006
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    input supply0 id_5,
    input tri0 id_6,
    output supply0 id_7
);
  wire id_9;
  wor  id_10 = id_6;
  always @(posedge id_10 or posedge id_4) begin
    deassign id_7;
  end
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    output tri id_2,
    input supply0 id_3,
    input tri0 id_4,
    output logic id_5,
    input tri1 id_6,
    output wor id_7
);
  wor   id_9 = id_3#(.id_1(1));
  logic id_10;
  module_0(
      id_6, id_0, id_4, id_9, id_4, id_0, id_6, id_9
  );
  always id_5 <= #1 1;
  assign #id_11 id_5 = id_10;
endmodule
