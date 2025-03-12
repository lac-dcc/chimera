// Seed: 2152823275
module module_0 (
    output logic id_0,
    input wor id_1,
    input tri1 id_2,
    output tri1 id_3,
    output wand id_4,
    output tri id_5,
    input wand id_6,
    output supply1 id_7,
    input tri1 id_8
);
  always @(posedge id_6 or posedge 1) begin : LABEL_0
    if (1) begin : LABEL_1
      id_0 <= 1 - id_1;
    end
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wor id_1,
    input supply1 id_2,
    output logic id_3,
    input tri1 id_4,
    output logic id_5
);
  always
    if (1)
      if (-1'h0) id_5 <= 1;
      else if ({1 == 1{-1}}) id_3 <= id_4;
      else id_3 <= ~id_4 ? 1 : -1;
    else begin : LABEL_0
      id_3 <= 1;
      $unsigned(34);
      ;
    end
  assign id_0 = 1;
  always @(posedge ~id_4 or id_2 - 1) force id_5 = -1 == id_2;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_1,
      id_0,
      id_1,
      id_4,
      id_0,
      id_2
  );
  wire id_7;
  ;
endmodule
