// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module memory (
    input clk, rst, w_r_en,
    input [7:0] writeData,
    input [9:0] memAdr,
    output reg [31:0] readData
  );

  reg [31:0] memory [0:128];

  initial
  begin
    $readmemh("input.txt", memory);
  end

  always @(posedge clk)
  begin
    if (w_r_en) //w_r_en 1 ->  write enable
    begin
      memory[memAdr] <= writeData;
    end
    else
    begin //w_r_en 0 -> read enable
      // readData <= {memory[memAdr], memory[memAdr+1], memory[memAdr+2], memory[memAdr+3]};
      readData <= memory[memAdr];
    end
  end
endmodule





