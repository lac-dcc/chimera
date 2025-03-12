// Seed: 1641256153
module module_0 (
    output logic   id_0,
    input  supply0 id_1,
    input  supply0 id_2,
    output logic   id_3
);
  always @(posedge (id_1) or posedge id_2 - -1) begin : LABEL_0
    id_3 = -1;
    id_3 <= 1;
    fork
      id_3 = 1'b0;
      id_3 <= id_2;
      id_0 <= id_1;
      if (-1) @(id_2 - id_1 or posedge id_1) $unsigned(46);
      ;
    join
    id_3 = -1;
  end
  wire id_5;
  wire [1  -  1 : -1] id_6, id_7;
  assign module_1.id_4 = 0;
  logic id_8;
  ;
endmodule
module module_1 (
    input tri id_0,
    output logic id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wand id_4,
    input tri0 id_5
);
  assign id_1 = id_5;
  initial
    if (1 - 1) begin : LABEL_0
      id_1 = -1 == -1;
      id_1 = 1;
    end else id_1 <= id_4 < 1;
  logic id_7;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1
  );
endmodule
