// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module memory (
    input clk, rst, w_r_en,
    // input [7:0] writeData,
    input [9:0] memAdr,
    output reg [31:0] readData
  );

  reg [7:0] memory [0:127][0:3];

  initial
  begin
    $readmemh("file/input.txt", memory);
    // $readmemh("file/input.txt", memory);
    // $readmemh("file/input2.txt", memory);
    // $readmemh("file/test1_inp_5_74_83.txt", memory);
    // $readmemh("file/test2_inp_4_69_73.txt", memory);
    // $readmemh("file/test3_inp_4_70_76.txt", memory);

  end

  // always @(posedge clk)
  // begin
  //   if (w_r_en) //w_r_en 1 ->  write enable
  //   begin
  //     memory[memAdr / 4][memAdr % 4] <= writeData;
  //   end
  // end

  always @(*)
  begin
    if (w_r_en == 1'b0)
    begin 
      readData[7:0] <= memory[memAdr][0];
      readData[15:8] <= memory[memAdr][1];
      readData[23:16] <= memory[memAdr][2];
      readData[31:24] <= memory[memAdr][3];
    end
  end

endmodule






