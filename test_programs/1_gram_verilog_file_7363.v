// Seed: 593943925
module module_0 (
    input wor id_0,
    input wire id_1,
    output supply0 id_2,
    input tri0 id_3,
    input wand id_4
);
  wire id_6;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output tri0 id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4,
    input wire id_5,
    input tri0 id_6,
    output logic id_7,
    input wand id_8,
    input supply0 id_9
);
  always id_7 <= #1 -1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_9,
      id_5
  );
  function id_11;
    input id_12 = !id_6 && -1'b0;
    @(posedge -1) begin : LABEL_0
      id_11 = -1 * id_11;
      id_1  = id_0;
    end
  endfunction
endmodule
